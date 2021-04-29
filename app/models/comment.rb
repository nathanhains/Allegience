class Comment < ApplicationRecord
    belongs_to :civilian_faction
    belongs_to :civilian
end
