class Planner < ApplicationRecord
    has_secure_password
    has_many :post
end
