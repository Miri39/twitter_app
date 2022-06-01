class UsersController < ApplicationController
  before_action :check_user, only: [ :index, :show, :destroy ]
  before_action :admin_user, only: [ :destroy ]
  before_action :check_delete_user, only: [ :destroy ]
    def index
        # o variabila fara @ este vizibila doar in functie
        # o variabila cu @ este vizibila si in afara functiei
        @users = User.all
    end
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:userDeleted] = "The user was successfully deleted."
      redirect_to users_url
    end

    def show
      @user = User.where(id: params[:id]).first
      if @user.present?
        @posts = @user.posts.paginate(page: params[:page], per_page: 5)
        @post = Post.new
      else
        flash[:invalidUser] = "This user doesn't exist"
        redirect_to "/users"
      end
    end
    
    def new
      @user = User.new
    end
    
    def create
      # user = User.new(name: params['user']['name'], email: params['user']['email'], age: params['user']['age'], gender: params['user']['gender'], phone_number: params['user']['phone_number'])
      @user = User.new(user_params)

      
      if @user.save
        flash[:success] = 'Successfully created a new user'
        # redirect_to "/users/#{@user.id}"
        log_in(@user)
        redirect_to user_path(@user)
      else
        # flash[:error] = 'Validations failed'
        # redirect_to '/users/new'
        render 'users/new'
      end
    end
    
    def following
      @title = 'Following'
      @user = User.find(params[:id])
      @users = @user.following.paginate(page: params[:page])
      render 'show_follow'
    end
    def following
      @title = 'Followers'
      @user = User.find(params[:id])
      @users = @user.followers.paginate(page: params[:page])
      render 'show_follow'
    end

    private
    
    def check_delete_user
      user = User.find(params[:id])
      if user.name[0] != 'A'
        redirect_to users_path
      end
    end
    def user_params
      params.require(:user).permit(:name, :email, :password, :age, :gender, :phone_number)
    end
end