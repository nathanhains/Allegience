class Villainization < ApplicationRecord
    belongs_to :user
    belongs_to :villain
    has_many :powers, as: :powerable

    has_many :villainization_faction_requests, foreign_key: :requestor_id
    has_many :villainization_factions, :class_name => "VillainizationFaction", :foreign_key => "owner_id", :dependent => :delete_all
    has_many :faction_requests, through: :villainization_faction_requests

    has_many :villain_comments
    
    mount_uploader :avatar, AvatarUploader
end
