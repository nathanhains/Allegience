module HeroizationFactionsHelper
    def find_user_heroization
        @hero = Hero.find_by(name: @current_user.alter_ego)
        @heroization = Heroization.find_by(user_id: @current_user.id, hero_id: @hero.id)
    end
end
