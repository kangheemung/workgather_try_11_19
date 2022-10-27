class Event < ApplicationRecord
    mount_uploader :Image, ImageUploader
end
