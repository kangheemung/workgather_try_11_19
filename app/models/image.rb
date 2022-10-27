class Image < ApplicationRecord
    mount_uploader :name, ImageUploader
    belongs_to :user, class_name:"User"
    belongs_to :planner, class_name:"Planner" 
end
