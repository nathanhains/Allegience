class Job < ApplicationRecord
    belongs_to :requestor_user, :class_name => "User"
    has_many :acceptances, foreign_key: :job_response_id
    has_many :responder_users, through: :acceptances, source: :responder
    validate :is_title_case
    
    before_save :make_title_case

    private
    def is_title_case
        if title.split.any?{|w|w[0].upcase != w[0]}
            errors.add(:title, "Title must be in title case")
        end
    end

    def make_title_case
        self.title = self.title.titlecase
    end

end
