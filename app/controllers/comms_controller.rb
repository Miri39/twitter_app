class CommsController < ApplicationController
  before_action :check_user, only: [ :create ]
  before_action :count_like
    def index
        @comms = Comm.where(post_id: params[:id]).all
    end
   
    def create
      @comm = Comm.new(comm_params)
      # @post = Post.where(id: params[:id]).first
      @comm.user_id = current_user.id
      puts @comm.post_id
      # puts @comm.user_id
      
      if @comm.save
        redirect_to post_path(@comm.post_id)
      else
        puts current_user.id
        redirect_to post_path(@comm.post_id)
        # @user = current_user
        # render 'posts/show', status: 422
        
      end
    end
    def toggle_like_c
      @comm = Comm.find(params[:id])
      like = @likes.where(user_id: current_user.id, comm_id: @comm.id)
      if like.count == 1
        dislike = Like.find(like.first.id)
        dislike.destroy
        redirect_to request.original_url
      else
        Like.new(user_id: current_user.id, comm_id: @comm.id).save
        redirect_to request.original_url
      end   
    end
    private 
    def count_like
      @likes = Like.where.not(comm_id: nil).all
    end
    def comm_params
      params.require(:comm).permit(:text, :post_id)
    end
end
