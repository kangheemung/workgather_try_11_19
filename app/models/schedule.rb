class Schedule < ApplicationRecord
  belongs_to :planner
  belongs_to :workshop
  validates_uniqueness_of :workshop_id, scope: :planner_id
  has_many :reservations, class_name: "Reservation"
end
