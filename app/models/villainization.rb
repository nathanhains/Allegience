class Villainization < ApplicationRecord
    belongs_to :user
    belongs_to :villain
    has_many :powers, as: :powerable
    has_many :comments, as: :commentable
    mount_uploader :avatar, AvatarUploader
end
