class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :first_eight_except, ->(set){
    all.limit(8).where.not(set)
  }

end
