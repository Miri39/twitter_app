class UsersController < ApplicationController
    def index
        # o variabila fara @ este vizibila doar in functie
        # o variabila cu @ este vizibila si in afara functiei
        @users = User.all
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:userDeleted] = "The user was successfully deleted."
      redirect_to users_url
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
      # user = User.new(name: params['user']['name'], email: params['user']['email'], age: params['user']['age'], gender: params['user']['gender'], phone_number: params['user']['phone_number'])
      @user = User.new(user_params)

      
      if @user.save
        flash[:success] = 'Successfully created a new user'
        redirect_to "/users/#{@user.id}"
      else
        # flash[:error] = 'Validations failed'
        # redirect_to '/users/new'
        render 'users/new'
      end
    end
    
    private
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :age, :gender, :phone_number)
    end
  end