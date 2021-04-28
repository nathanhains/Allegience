class Civilian < ApplicationRecord
    belongs_to :user
    has_many :civilian_faction_requests, foreign_key: :requestor_id
    has_many :civilian_factions, :class_name => "CivilianFaction", :foreign_key => "owner_id"
    has_many :faction_requests, through: :civilian_faction_requests
    has_many :comments, as: :commentable
    mount_uploader :avatar, AvatarUploader
end
