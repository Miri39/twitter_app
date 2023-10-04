class ApplicationController < ActionController::Base
include SessionsHelper
    

    def helloblabla
        # render html: 'Hello, salut!'
        if logged_in?
            redirect_to users_path
        else
            redirect_to login_path
        end
    end

    def count_like
        @likes = Like.all
    end

    def check_user
        if !logged_in?
          redirect_to login_path
        end
    end
    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end
end