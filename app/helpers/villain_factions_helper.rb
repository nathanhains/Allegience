module VillainFactionsHelper
    def find_user_villainization
        @villain = Villain.find_by(name: @current_user.alter_ego)
        @villainization = Villainization.find_by(user_id: @current_user.id, villain_id: @villain.id)
    end
end
