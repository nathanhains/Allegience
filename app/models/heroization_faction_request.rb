class HeroizationFactionRequest < ApplicationRecord
    belongs_to :requestor, class_name: "Heroization"
    belongs_to :faction_request, class_name: "HeroizationFaction"
end
