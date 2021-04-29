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
        end
    end


end
