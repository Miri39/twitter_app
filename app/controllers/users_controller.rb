class UsersController < ApplicationController


def index
    # o variabila fara @ e vizibila doar in functie, iar cu @ e globala
    @user = User.all
end

def show
    @user = User.where(id: params[:id]).first
end

end