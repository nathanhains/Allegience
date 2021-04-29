class Villainization < ApplicationRecord
    belongs_to :user
    belongs_to :villain
    has_many :powers, as: :powerable

    has_many :civilian_faction_requests, foreign_key: :requestor_id
    has_many :civilian_factions, :class_name => "CivilianFaction", :foreign_key => "owner_id"
    has_many :faction_requests, through: :civilian_faction_requests

    has_many :hero_comments
    
    mount_uploader :avatar, AvatarUploader
end
