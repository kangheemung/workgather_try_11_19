class Image < ApplicationRecord
    mount_uploader :name, ImageUploader
    belongs-to :user, class_name:"User"
    belongs-to :planner, class_name:"Planner" 
end
