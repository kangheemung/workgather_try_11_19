class Reservation < ApplicationRecord
    belongs_to :user ,class_name: "User"
    has_many :workshops,class_name: "Workshop"
    has_many :user_workshops,class_name:"UserWorkshop"
end
