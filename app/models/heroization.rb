class Heroization < ApplicationRecord
    belongs_to :hero
    belongs_to :user
    has_many :powers, as: :powerable
    validates :hero_level, length: {maximum: 10}
    has_many :comments, as: :commentable
    mount_uploader :avatar, AvatarUploader
end
