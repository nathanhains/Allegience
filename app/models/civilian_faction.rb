class CivilianFaction < ApplicationRecord
    belongs_to :owner, :class_name => "Civilian"
    has_many :civilian_faction_requests, foreign_key: :faction_request_id
    has_many :requestors, through: :civilian_faction_requests, source: :requestor
    has_many :comments, as: :commentable
end
