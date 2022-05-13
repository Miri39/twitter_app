class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.where(id: params[:id]).first
      if @post.nil?
        flash[:invalidUser] = "This post doesn't exist"
        redirect_to "/posts"
      end
    end

end

