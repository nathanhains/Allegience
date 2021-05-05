class VillainizationFaction < ApplicationRecord
    belongs_to :owner, :class_name => "Villainization"
    has_many :villainization_faction_requests, foreign_key: :faction_request_id
    has_many :requestors, through: :villainization_faction_requests, source: :requestor
    has_many :villain_comments
end
