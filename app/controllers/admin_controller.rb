class AdminController < ApplicationController
    before_action :check_user, only: [ :index ]
    before_action :admin_user, only: [ :index, :toggleAdmin ]


    def index
        @users = User.all
    end
    
    def toggleAdmin
        @user = User.where(id: params[:id]).first
        @user.admin = !@user.admin
        @user.save
        status = if @user.admin
                    "admin"
                else
                    "non-admin"
                end
        flash[:updatedStatus] = "Successfully updated user #{@user.name} to #{status}."
        redirect_to "/admin/statistics"
    end

    private
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :age, :gender, :phone_number, :admin)
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
