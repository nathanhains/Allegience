class UsersController < ApplicationController

    def new
        if session[:current_user_id]
            redirect_to "/", :notice => "Already logged in!"
        else
            @user = User.new
        end
    end

    def create 
        @user = User.new(params.require(:user).permit(:username, :email, :password))
        if @user.valid?
            @user.save
            redirect_to "/login"
        else
            render :new
        end
    end

end
