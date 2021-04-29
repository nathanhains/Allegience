class VillainizationFactionRequest < ApplicationRecord
    belongs_to :requestor, class_name: "Civilian"
    belongs_to :faction_request, class_name: "CivilianFaction"
end
