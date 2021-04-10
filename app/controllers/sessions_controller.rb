class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:current_user_id] = @user.id
            redirect_to "/"
        else
            redirect_to "/login", :notice => "Can't find the user."
        end
    end
end
