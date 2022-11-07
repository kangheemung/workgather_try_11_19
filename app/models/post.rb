class Post < ApplicationRecord
    mount_uploader :Image, ImageUploader
    validates :title,:image,:content,{presence: true}
    belongs_to :image
    belongs_to :user,class_name: "User"
end