class UsersController < ApplicationController
    def index
        # o variabila fara @ este vizibila doar in functie
        # o variabila cu @ este vizibila si in afara functiei
        @users = User.all
    end

    def show
        @user = User.where(id: params[:id]).first
    end
    
    def new
      @user = User.new
    end
    
    def create
      user = User.new(name: params['user']['name'])

      if user.save
        redirect_to "/users/#{user.id}"
      else
        flash[:error] = 'Validations failed'
        redirect_to '/users/new'
      end
    end
end