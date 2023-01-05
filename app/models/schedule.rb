class Schedule < ApplicationRecord
  belongs_to :planner,optional: true
  belongs_to :workshop,optional: true
  has_many :reservations, class_name: "Reservation"
end
