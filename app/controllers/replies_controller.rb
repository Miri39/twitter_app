class RepliesController < ApplicationController
  before_action :check_user, only: [ :create ]
  before_action :count_like
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
           redirect_to comm_path(@reply.comm_id)
          # @user = current_user
          # render 'posts/show', status: 422
          
        end
    end
    
    def toggle_like_r
      @reply = Reply.find(params[:id])
      like = @likes.where(user_id: current_user.id, reply_id: @reply.id)
      if like.count == 1
        dislike = Like.find(like.first.id)
        dislike.destroy
        redirect_to request.original_url
      else
        Like.new(user_id: current_user.id, reply_id: @reply.id).save
        redirect_to request.original_url
      end   
    end

    private 
    
    def reply_params
      params.require(:reply).permit(:text)
    end
    def count_like
      @likes = Like.where.not(reply_id: nil)
    end

end
