class Reservation < ApplicationRecord
    belongs_to :user, optional: true 
    belongs_to :workshop, optional: true 
end
