class Acceptance < ApplicationRecord
    belongs_to :responder, class_name: "User"
    belongs_to :job_response, class_name: "Job"
end
