class UserWorkshop < ApplicationRecord
    belongs_to :user
    belongs_to :workshop
    has_many :posts
end
