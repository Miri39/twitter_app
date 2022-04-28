class UsersController < ApplicationController
    def index
        # o variabila fara @ este vizibila doar in functie
        # o variabila cu @ este vizibila si in afara functiei
        @users = User.all
        @deleteUser = User.delete(User.where(id: params[:id]).first)
    end

    def show
      @user = User.where(id: params[:id]).first
      if @user.nil?
        flash[:invalidUser] = "This user doesn't exist"
        redirect_to "/users"
      end
    end
    
    def new
      @user = User.new
    end
    
    def create
      user = User.new(name: params['user']['name'], email: params['user']['email'], age: params['user']['age'], gender: params['user']['gender'], phone_number: params['user']['phone_number'])


      if user.save
        flash[:success] = 'Successfully created a new user'
        redirect_to "/users/#{user.id}"
      else
        flash[:error] = 'Validations failed'
        redirect_to '/users/new'
      end
    end
end