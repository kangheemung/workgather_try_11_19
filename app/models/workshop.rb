class Workshop < ApplicationRecord
    mount_uploader :image, WorkshopPhotoUploader 
    belongs_to :planner,optional: true
end
