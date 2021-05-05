class Job < ApplicationRecord
    belongs_to :requestor_user, :class_name => "User"
    has_many :acceptances, foreign_key: :job_response_id
    has_many :responder_users, through: :acceptances, source: :responder
    validate :is_title_case
    validates :title, presence: true
    validates :description, presence: true
    validates :requirement, presence: true
    validates :reward, presence: true

    before_validation :make_title_case

    private
    REWARDS = [1,2,3,4,5]
    LEVELS = [1,2,3,4,5,6,7,8,9]
    STORY_EXCLUSION = [1,2,3,4,5,6,7,8]

    def is_title_case
        if title.split.any?{|w|w[0].upcase != w[0]}
            errors.add(:title, "Title must be in title case")
        end
    end

    def make_title_case
        self.title = self.title.titlecase
    end

end
