class PostsController < ApplicationController
  before_action :check_user, only: [ :create, :edit, :update ]


    def index
        @posts = Post.all
        @posts = @posts.paginate(page: params[:page], per_page: 5)
        @post = Post.new
    end

    def show
      @post = Post.where(id: params[:id]).first
      @comms = Comm.where(post_id: @post.id).all
      @comm = Comm.new
      if @post.nil?
        flash[:invalidUser] = "This post doesn't exist"
        redirect_to "/posts"
      end
    end

    
    def create
      puts current_user.id
      @post = current_user.posts.new(post_params)
      if @post.save
        redirect_to user_path(current_user)
      else
        puts current_user.id
        @user = current_user
        @posts = @user.posts.paginate(page: params[:page], per_page: 5)
        render 'users/show', status: 422
        
      end
    end
    
    def edit
      if logged_in? &&  Post.find(params[:id]).user_id == current_user.id
        @post = Post.find(params[:id])
      else
        redirect_to users_path 
      end
    end

    def update
      if logged_in? &&  Post.find(params[:id]).user_id == current_user.id
        @post = Post.find(params[:id])
        if @post.update(post_params)
          redirect_to user_path(current_user)
        else
          render 'posts/edit',  status: 422
        end
      else 
        redirect_to users_path
      end
    end

    private 
    
    def post_params
      params.require(:post).permit(:title, :description)
    end
end

