class Post < ApplicationRecord
    mount_uploader :Image, ImageUploader
    belongs_to :image
    belongs_to :user
end
