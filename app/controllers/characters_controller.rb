class CharactersController < ApplicationController
    before_action :authentication_required
    before_action :maximum_characters, only: [:index, :create]
    def index
        @villains = Villain.first_eight_except(id: current_user.villains.ids)
        @heros = Hero.first_eight_except(id: current_user.heros.ids)
        render layout: 'job'
    end

    def create
        @hero = Hero.find_by(name: params[:format])
        @villain = Villain.find_by(name: params[:format])
        if !@hero.nil?
            @heroization = Heroization.new(user_id: current_user.id, hero_id: @hero.id)
            if @heroization
                @heroization.save
                redirect_to user_path(current_user)
                return
            end
        elsif !@villain.nil?
            @villainization = Villainization.new(user_id: current_user.id, villain_id: @villain.id)
            if @villainization
                @villainization.save
                redirect_to user_path(current_user)
                return
            end
        else
            redirect_to roster_path
        end
    end

    def destroy
        if params[:format]
           find_powered
            if @hero
                heroization_exists?
                redirect_to user_path(current_user)
            elsif @villain
                villainization_exists?
                redirect_to user_path(current_user)
            else
                rredirect_to user_path(current_user)
            end
        else
            redirect_to user_path(current_user)
        end
    end


    private
    def find_powered
        @hero = Hero.find_by(name: params[:format])
        @villain = Villain.find_by(name: params[:format])
    end

    def heroization_exists?
        @heroization = Heroization.find_by(hero_id: @hero.id, user_id: current_user.id)
        if @heroization
            @heroization.destroy
            current_user.update(allegience: current_user.civilian.allegience, alter_ego: current_user.civilian.name, avatar: current_user.civilian.avatar)
        end
    end

    def villainization_exists?
        @villainization = Villainization.find_by(villain_id: @villain.id, user_id: current_user.id)
        if @villainization
            @villainization.destroy
            current_user.update(allegience: current_user.civilian.allegience, alter_ego: current_user.civilian.name, avatar: current_user.civilian.avatar)
        end
    end
    
end
