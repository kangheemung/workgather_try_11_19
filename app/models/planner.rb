class Planner < ApplicationRecord
    validates :user_name,:email,:password,:password_confirmation,:first_name,:last_name,:birthday,:gender,{presence: true}
    has_secure_password
    has_many :workshops
end
