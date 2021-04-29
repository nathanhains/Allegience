class CharactersController < ApplicationController
    before_action :authentication_required
    before_action :maximum_characters
    def index
        @villains = Villain.all.limit(8).where.not(id: current_user.villains.ids)
        @heros = Hero.all.limit(8).where.not(id: current_user.heros.ids)
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

    def edit
    end

    def update
    end
    
end
