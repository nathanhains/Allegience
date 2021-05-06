class VillainizationFactionsController < ApplicationController
    before_action :villain?
    before_action :villain_of_level?

    def new
        @villainization_faction = VillainizationFaction.new
        render layout: 'faction'
    end

    def index
        if params[:id]
            @villainization_factions = VillainizationFaction.where(owner_id: params[:id])
        else
            @villainization_factions = VillainizationFaction.all
        end
        render layout: 'faction'
    end

    def create
        find_user_villainization
        @villainization_faction = VillainizationFaction.new(params.require(:villainization_faction).permit(:name))
        @villainization_faction.owner_id = @villainization.id
        if @villainization_faction.valid?
            @villainization_faction.save
            redirect_to villainization_faction_path(@villainization_faction)
        else
            render :new, layout: 'chat'
        end
    end

    def show
        find_user_villainization
        @villainization_faction = VillainizationFaction.find(params[:id])
        @villainization_faction_request = VillainizationFactionRequest.find_by(requestor_id: @villainization.id, faction_request_id: @villainization_faction.id)
        @villain_comment = Comment.new
        render layout: 'chat'
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
        @villainization_faction = VillainizationFaction.find_by(params[:id])
        if @villainization_faction.owner_id == @villainization.id
            @requests = VillainizationFactionRequest.all.where(faction_request_id: @villainization_faction.id, accepted: false)
        else
            render :show
        end
        render layout: 'chat'
    end

    def accept
        @villainization_faction_request = VillainizationFactionRequest.find_by(requestor_id: params[:format], faction_request_id: params[:villainization_faction_id])
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

    def villain_of_level?
        find_user_villainization
        if @villainization.villain_level < 3
            flash[:message] = "Locked until level 3."
            redirect_to user_path(current_user)
        end
    end
end
