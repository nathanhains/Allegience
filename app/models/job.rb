class Job < ApplicationRecord
    belongs_to :requestor_user, :class_name => "User"
    has_many :acceptances, foreign_key: :job_response_id
    has_many :responder_users, through: :acceptances, source: :responder
end
