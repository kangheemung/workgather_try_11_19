class Profile < ApplicationRecord
    belongs_to :planner,class_name: "Planner",optional: true 
end
