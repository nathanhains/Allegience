class SessionsController < ApplicationController
    before_action :go_home, only: [:new, :create]
    skip_before_action :verify_authenticity_token

    def new
        @user = User.new
        render :layout => 'form'
    end

    def create
        if params[:user]
            @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
                login(@user)
                redirect_to user_path(@user)
            else
                redirect_to "/login", :notice => "Can't find the user."
            end
        end
    end

    def destroy
        reset_session
        redirect_to "/"
    end

    def omniauth
        user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider:request.env['omniauth.auth'][:provider]) do |u|
           create_omni_user(u)
        end
        if user.valid?
            login(user)
            redirect_to "/login"
        else
            redirect_to login_path
        end
    end

    private

    def create_omni_user(u)
        u.username = request.env['omniauth.auth'][:info][:first_name]
        u.alter_ego = request.env['omniauth.auth'][:info][:first_name]
        u.email = request.env['omniauth.auth'][:info][:email]
        u.password = SecureRandom.hex(15)
        u.avatar = File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/Unknown.png')
        u.civilian = Civilian.create(user_id: u.id, name: u.alter_ego, avatar: u.avatar)
    end
end
