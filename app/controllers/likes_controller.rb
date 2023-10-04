class LikesController < ApplicationController
    def index
        @likes = Likes.all
    end
end
