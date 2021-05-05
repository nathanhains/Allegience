class Heroization < ApplicationRecord
    belongs_to :hero
    belongs_to :user
    has_many :powers, as: :powerable
    validates :hero_level, length: {maximum: 10}

    has_many :heroization_faction_requests, foreign_key: :requestor_id
    has_many :heroization_factions, :class_name => "HeroizationFaction", :foreign_key => "owner_id", :dependent => :delete_all
    has_many :faction_requests, through: :heroization_faction_requests

    has_many :hero_comments

    mount_uploader :avatar, AvatarUploader
end
