class User < ApplicationRecord
    validates :user_name,:email,:password,:password_confirmation,:first_name,:last_name,:birthday,:gender,{presence: true}
    has_secure_password
    has_many :posts
    has_many :workshops
    has_many :images, class_name: "Image"
end
