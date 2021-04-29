class UsersController < ApplicationController
    before_action :check_authorization, only: [:edit, :update]

    def new
        if session[:current_user_id]
            redirect_to "/", :notice => "Already logged in!"
        else
            @user = User.new
        end
    end

    def show
        find_user
    end

    def create 
        @user = User.new(user_params)
        user_default_avatar
        @user.civilian = Civilian.create(user_id: @user.id, name: @user.alter_ego, avatar: @user.avatar)
        if @user.valid?
            # UserMailer.with(user: @user).welcome_email.deliver!
            @user.save  
            redirect_to "/login"
        else
            render :new
        end
    end

    def edit
        find_user
    end

    def update
        find_user
        if @user.update(user_params) && @user.civilian.update(avatar: @user.avatar)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def allegience
        @hero = Hero.find_by(name: params[:user_id])
        @villain = Villain.find_by(name: params[:user_id])
        @civilian = Civilian.find_by(name: params[:user_id])
        determine_allegience
    end

    private
    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :alter_ego, :email, :password, :avatar)
    end

    def user_default_avatar
        File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/Unknown.png') do |f|
            @user.avatar = f
        end
    end

    def determine_allegience
        if @hero
            #add name attribute upon user creation and change the name instead
            if current_user.update(allegience: @hero.allegience, alter_ego: @hero.name, avatar: @hero.avatar)
                redirect_to user_path(current_user)
            end
        elsif @villain
            if current_user.update(allegience: @villain.allegience, alter_ego: @villain.name, avatar: @villain.avatar)
                redirect_to user_path(current_user)
            end
        elsif @civilian
            if current_user.update(allegience: @civilian.allegience, alter_ego: @civilian.name, avatar: @civilian.avatar)
                redirect_to user_path(current_user)
            end
        else
            redirect_to user_path(current_user)
        end
    end

end
