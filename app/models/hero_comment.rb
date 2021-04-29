class HeroComment < ApplicationRecord
    belongs_to :heroization_faction
    belongs_to :heroization
end
