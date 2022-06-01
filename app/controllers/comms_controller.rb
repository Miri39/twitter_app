class CommsController < ApplicationController
  before_action :check_user, only: [ :create ]

    def index
        @comms = Comm.where(post_id: params[:id]).all
    end
   
    def create
      if @comm.user_id == current_user.id
        @comm = Comm.new(comm_params)
        # @post = Post.where(id: params[:id]).first
        @comm.user_id = current_user.id
        puts @comm.post_id
        # puts @comm.user_id
        
        if @comm.save
          redirect_to post_path(@comm.post_id)
        else
          puts current_user.id
          # @user = current_user
          # render 'posts/show', status: 422
          
        end
      else
        redirect_to post_path(@comm.post_id)
      end
    end

    private 
    
    def comm_params
      params.require(:comm).permit(:text, :post_id)
    end
end
