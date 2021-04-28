class Hero < ApplicationRecord
    has_many :heroizations
    has_many :users, through: :heroizations
    has_one :power, as: :powerable
    mount_uploader :avatar, AvatarUploader
end
