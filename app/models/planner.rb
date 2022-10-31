class Planner < ApplicationRecord
    has_secure_password
    has_many :workshop
end
