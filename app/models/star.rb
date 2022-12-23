class Star < ApplicationRecord
    belongs_to :user
    belongs_to :workshop
    #validates :score, presence: true
end

