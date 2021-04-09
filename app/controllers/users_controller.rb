class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create 
        @user = User.create(params.require(:user).permit(:username, :email, :password))
        redirect_to user_path(@user)
    end

end
