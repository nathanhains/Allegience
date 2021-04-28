class Villain < ApplicationRecord
    has_many :villainizations
    has_many :users, through: :villainiations
    has_one :power, as: :powerable
    mount_uploader :avatar, AvatarUploader
end
