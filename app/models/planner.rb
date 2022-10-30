class Planner < ApplicationRecord
    has_secure_password
    has_many :event
    has_many :workshop
end
