class RepliesController < ApplicationController
  before_action :check_user, only: [ :create ]
    def index
        @comm = Comm.where(id: params[:comm_id]).first
        @replies = Reply.where(comm_id: params[:comm_id]).all

    end

    def create
        @reply = Reply.new(text: params[ :text ], comm_id: params[ :comm_id ], user_id: current_user.id)
        puts @reply.user_id
        puts @reply.comm_id
        if @reply.save
          redirect_to comm_path(@reply.comm_id)
        else
           puts current_user.id
          # @user = current_user
          # render 'posts/show', status: 422
          
        end
    end

    private 
    
    def reply_params
      params.require(:reply).permit(:text)
    end

end
