class Post < ApplicationRecord
    mount_uploader :image, PostImageUploader
    validates :title,:image,:content,{presence: true}
    belongs_to :user,class_name: "User"
    
end