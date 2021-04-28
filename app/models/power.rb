class Power < ApplicationRecord
    belongs_to :powerable, polymorphic: true
end
