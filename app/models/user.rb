class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true 
  
  has_many :acceptances, foreign_key: :responder_id
  has_many :job_requests, :class_name => "Job", :foreign_key => "requestor_user_id"
  has_many :job_responses, through: :acceptances
  has_many :heroizations
  has_many :villainizations
  has_many :heros, through: :heroizations
  has_many :villains, through: :villainizations
  has_one :civilian

  mount_uploader :avatar, AvatarUploader
end
