class UsersController < ApplicationController
    before_action :check_authorization, only: [:edit, :update]

    def new
        
        if session[:current_user_id]
            redirect_to "/", :notice => "Already logged in!"
        else
            @user = User.new
        end
        render :layout => 'form'
    end

    def show
        find_user
        civilian?
        hero?
        villain?
        render :layout => 'profile'
    end

    def create 
        @user = User.new(user_params)
        user_default_avatar(@user)
        @user.civilian = Civilian.create(user_id: @user.id, name: @user.alter_ego, avatar: @user.avatar)
        if @user.valid?
            # UserMailer.with(user: @user).welcome_email.deliver!
            @user.save  
            redirect_to "/login"
        else
            render :new, :layout => 'form'
        end
    end

    def edit
        find_user
        render :layout => 'form'
    end

    def update
        find_user
        if @user.update(user_params)
            if params[:user][:avatar]
                @user.civilian.update(params.require(:user).permit(:avatar))
            end
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

    def civilian?
        if params[:format]
            @show_civilian = Civilian.find_by(id: params[:format])
        end
    end

    def hero?
        if params[:hero]
            @show_hero = Heroization.find_by(id: params[:hero])
        end
    end

    def villain?
        if params[:villain]
            @show_villain = Villainization.find_by(id: params[:villain])
        end
    end

    def user_params
        if @user
            if @user.allegience =="Civilian"
                params.require(:user).permit(:username, :alter_ego, :email, :password, :password_confirmation, :avatar)
            else
                params.require(:user).permit(:username, :alter_ego, :email, :password, :password_confirmation)
            end
        else
            params.require(:user).permit(:username, :alter_ego, :email, :password, :password_confirmation)
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
