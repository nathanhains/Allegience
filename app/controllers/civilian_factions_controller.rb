class CivilianFactionsController < ApplicationController
    before_action :civilian?

    def new
        @civilian_faction = CivilianFaction.new
    end

    def index
        @civilian_factions = CivilianFaction.all
    end

    def create
        @civilian_faction = CivilianFaction.new(params.require(:civilian_faction).permit(:name))
        @civilian_faction.owner_id = current_user.civilian.id
        if @civilian_faction.valid?
            @civilian_faction.save
            redirect_to civilian_faction_path(@civilian_faction)
        else
            render :new
        end
    end

    def show
        @civilian_faction = CivilianFaction.find(params[:id])
        @civilian_faction_request = CivilianFactionRequest.find_by(requestor_id: current_user.civilian.id, faction_request_id: @civilian_faction.id)
        @comment = Comment.new
    end

    def update
        @civilian_faction = CivilianFaction.find(params[:id])
        @civilian_faction.requestors << current_user.civilian
        # @civililan_faction_request = CivilianFactionRequest.new(requestor_id: current_user.civilian.id, faction_request_id: @civilian_faction.id)
        if @civilian_faction.save
            redirect_to civilian_factions_path
        else
            redirect_to civilian_faction_path(@civilian_faction)
        end
    end

    def requests
        @civilian_faction = CivilianFaction.find_by(params[:id])
        if @civilian_faction.owner_id == current_user.id
            @requests = CivilianFactionRequest.all.where(faction_request_id: @civilian_faction.id, accepted: false)
        else
            render :show
        end
    end

    def accept
        @civilian_faction_request = CivilianFactionRequest.find_by(requestor_id: params[:format], faction_request_id: params[:civilian_faction_id])
        if @civilian_faction_request.update(accepted: true)
            redirect_to civilian_faction_requests_path(@civilian_faction_request.faction_request)
        else
            redirect_to civilian_faction_requests_path(@civilian_faction_request.faction_request)
        end
    end

    private

    def civilian?
        if current_user.allegience != "Civilian"
            redirect_to user_path(current_user)
        end
    end

end
