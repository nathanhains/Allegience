class Comment < ApplicationRecord
    belongs_to :commentable, polymorphic: true
    belongs_to :civilian
    belongs_to :heroization
    belongs_to :villainization
end
