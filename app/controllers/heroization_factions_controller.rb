class HeroizationFactionsController < ApplicationController
    before_action :hero?

    def new
        @heroization_faction = HeroizationFaction.new
    end

    def index
        @heroization_factions = HeroizationFaction.all
    end

    def create
        find_user_heroization
        @heroization_faction = HeroizationFaction.new(params.require(:heroization_faction).permit(:name))
        @heroization_faction.owner_id = @heroization.id
        if @heroization_faction.valid?
            @heroization_faction.save
            redirect_to heroization_faction_path(@heroization_faction)
        else
            render :new
        end
    end

    def show
        find_user_heroization
        @heroization_faction = HeroizationFaction.find(params[:id])
        @heroization_faction_request = HeroizationFactionRequest.find_by(requestor_id: @heroization.id, faction_request_id: @heroization_faction.id)
        @hero_comment = Comment.new
    end

    def update
        find_user_heroization
        @heroization_faction = HeroizationFaction.find(params[:id])
        @heroization_faction.requestors << @heroization
        # @heroization_faction_request = HeroizationFactionRequest.new(requestor_id: current_user.Heroization.id, faction_request_id: @Heroization_faction.id)
        if @heroization_faction.save
            redirect_to heroization_factions_path
        else
            redirect_to heroization_faction_path(@heroization_faction)
        end
    end

    def requests
        find_user_heroization
        @heroization_faction = HeroizationFaction.find_by(params[:id])
        if @heroization_faction.owner_id == current_user.id
            @requests = HeroizationFactionRequest.all.where(faction_request_id: @heroization_faction.id, accepted: false)
        else
            render :show
        end
    end

    def accept
        @heroization_faction_request = HeroizationFactionRequest.find_by(requestor_id: params[:format], faction_request_id: params[:heroization_faction_id])
        if @heroization_faction_request.update(accepted: true)
            redirect_to heroization_faction_requests_path(@heroization_faction_request.faction_request)
        else
            redirect_to heroization_faction_requests_path(@heroization_faction_request.faction_request)
        end
    end

    private

    def find_user_heroization
        @hero = Hero.find_by(name: current_user.alter_ego)
        @heroization = Heroization.find_by(user_id: current_user.id, hero_id: @hero.id)
    end

    def hero?
        if current_user.allegience != "Hero"
            redirect_to user_path(current_user)
        end
    end
end
