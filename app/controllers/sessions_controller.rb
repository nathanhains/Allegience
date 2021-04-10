class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            login(@user)
            redirect_to "/"
        else
            redirect_to "/login", :notice => "Can't find the user."
        end
    end

    def destroy
        reset_session
        redirect_to "/"
    end
end
