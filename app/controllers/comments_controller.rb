class CommentsController < ApplicationController
    def new
    end
   
    def create
        if params[:comment][:civilian_faction_id]
            @civilian_faction = CivilianFaction.find_by(id: params[:comment][:civilian_faction_id])
            @civilian_faction.comments.build(params.require(:comment).permit(:body, :civilian_faction_id, :civilian_id))
            if @civilian_faction.save
                redirect_to civilian_faction_path(@civilian_faction)
            else
                redirect_to civilian_faction_path(@civilian_faction)
            end
        elsif params[:comment][:heroization_faction_id]
            @heroization_faction = HeroizationFaction.find_by(id: params[:comment][:heroization_faction_id])
            @heroization_faction.hero_comments.build(params.require(:comment).permit(:body, :heroization_faction_id, :heroization_id))
            if @heroization_faction.save
                redirect_to heroization_faction_path(@heroization_faction)
            else
                redirect_to heroization_faction_path(@heroization_faction)
            end
        elsif params[:comment][:villainization_faction_id]
            @villainization_faction = VillainizationFaction.find_by(id: params[:comment][:villainization_faction_id])
            @villainization_faction.villain_comments.build(params.require(:comment).permit(:body, :villainization_faction_id, :villainization_id))
            if @villainization_faction.save
                redirect_to villainization_faction_path(@villainization_faction)
            else
                redirect_to villainization_faction_path(@villainization_faction)
            end
        end
    end


end
