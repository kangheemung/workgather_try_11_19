class Post < ApplicationRecord
    mount_uploader :Image, ImageUploader
end
