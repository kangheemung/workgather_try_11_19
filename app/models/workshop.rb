class Workshop < ApplicationRecord
    mount_uploader :image, WorkshopPhotoUploader 
    belongs_to :planner,class_name: "Planner",optional: true
end
