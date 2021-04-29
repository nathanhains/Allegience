class HeroizationFaction < ApplicationRecord
    belongs_to :owner, :class_name => "Heroization"
    has_many :heroization_faction_requests, foreign_key: :faction_request_id
    has_many :requestors, through: :heroization_faction_requests, source: :requestor
    has_many :hero_comments
end
