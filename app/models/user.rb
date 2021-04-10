class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true 
    has_many :job_requests, :class_name => "Job", :foreign_key => "requestor_id"
    has_many :job_responses, :class_name => "Job", :foreign_key => "responder_id"
end
