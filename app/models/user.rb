class User < ApplicationRecord
    #validates :user_name, presence: true
    #validates :email, presence: true, uniqueness: true
    #validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    #validates :password_confirmation, presence: true, length: { minimum: 6 }, allow_nil: true
    #validates :first_name, presence: true
    #validates :last_name, presence: true
    #validates :birthday, presence: true
    #validates :gender,{presence: true}
    has_secure_password 
    mount_uploader :u_profile_id,UProfileIdUploader 
    #resource :user, only: %i[show edit update]
    has_many :posts#, dependent::destroy
    has_many :workshops
    has_many :stars
    has_many :user_workshops
    has_many :reservations, dependent: :destroy
    has_many :images, class_name: "Image"
end
