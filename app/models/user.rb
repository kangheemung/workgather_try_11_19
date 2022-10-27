class User < ApplicationRecord
    has_secure_password
    has_many :posts 
    has_many :events
    has_many :images, class_name: "Image"
end
