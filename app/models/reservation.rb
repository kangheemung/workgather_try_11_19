class Reservation < ApplicationRecord
    belongs_to :user ,foreign_key: "user_id", optional: true
    belongs_to :workshop, foreign_key: "workshop_id"
   
end
 