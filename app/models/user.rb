class User < ApplicationRecord
    has_secure_password
    has_many :post 
    has_many :event
    has_many :images, class_name: "Image"
end
