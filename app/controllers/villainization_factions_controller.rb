class VillainizationFactionsController < ApplicationController
    before_action :villain?

    def new
        @villainization_faction = VillainizationFaction.new
    end

    def index
        @villainization_factions = VillainizationFaction.all
    end

    def create
        find_user_villainization
        @villainization_faction = VillainizationFaction.new(params.require(:villainization_faction).permit(:name))
        @villainization_faction.owner_id = @villainization.id
        if @villainization_faction.valid?
            @villainization_faction.save
            redirect_to villainization_faction_path(@villainization_faction)
        else
            render :new
        end
    end

    def show
        find_user_villainization
        @villainization_faction = VillainizationFaction.find(params[:id])
        @villainization_faction_request = VillainizationFactionRequest.find_by(requestor_id: @villainization.id, faction_request_id: @villainization_faction.id)
        @villain_comment = Comment.new
    end

    def update
        find_user_villainization
        @villainization_faction = VillainizationFaction.find(params[:id])
        @villainization_faction.requestors << @villainization
        # @villainization_faction_request = villainizationFactionRequest.new(requestor_id: current_user.villainization.id, faction_request_id: @villainization_faction.id)
        if @villainization_faction.save
            redirect_to villainization_factions_path
        else
            redirect_to villainization_faction_path(@villainization_faction)
        end
    end

    def requests
        find_user_villainization
        @villainization_faction = villainizationFaction.find_by(params[:id])
        if @villainization_faction.owner_id == current_user.id
            @requests = villainizationFactionRequest.all.where(faction_request_id: @villainization_faction.id, accepted: false)
        else
            render :show
        end
    end

    def accept
        @villainization_faction_request = villainizationFactionRequest.find_by(requestor_id: params[:format], faction_request_id: params[:villainization_faction_id])
        if @villainization_faction_request.update(accepted: true)
            redirect_to villainization_faction_requests_path(@villainization_faction_request.faction_request)
        else
            redirect_to villainization_faction_requests_path(@villainization_faction_request.faction_request)
        end
    end

    private

    def find_user_villainization
        @villain = Villain.find_by(name: current_user.alter_ego)
        @villainization = Villainization.find_by(user_id: current_user.id, villain_id: @villain.id)
    end

    def villain?
        if current_user.allegience != "Villain"
            redirect_to user_path(current_user)
        end
    end
end
