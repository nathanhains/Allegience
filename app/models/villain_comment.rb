class VillainComment < ApplicationRecord
    belongs_to :villainization_faction
    belongs_to :villainization
end
