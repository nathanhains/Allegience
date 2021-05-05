class VillainizationFactionRequest < ApplicationRecord
    belongs_to :requestor, class_name: "Villainization"
    belongs_to :faction_request, class_name: "VillainizationFaction"
end
