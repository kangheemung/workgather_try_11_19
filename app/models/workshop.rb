class Workshop < ApplicationRecord
    #validates :w_title,:w_theme,:image,:prefecture,:address1,:address2,:planner_id,:w_detail,:p_text,:p_detail,:profile_img,:time,:personnel,:precautions,{presence: true}
    mount_uploader :image, WorkshopPhotoUploader 
    belongs_to :planner,class_name: "Planner",optional: true 
end