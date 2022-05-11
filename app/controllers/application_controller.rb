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


end