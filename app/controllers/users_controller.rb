class UsersController < ApplicationController

    def new
        if session[:current_user_id]
            redirect_to "/", :notice => "Already logged in!"
        else
            @user = User.new
        end
    end

    def create 
        @user = User.create(params.require(:user).permit(:username, :email, :password))
        redirect_to "/login"
    end

end
