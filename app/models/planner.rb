class Planner < ApplicationRecord
  validates :user_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :password_confirmation, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :gender,{presence: true}
  has_secure_password
  has_many :workshops
  has_many :users
  has_many :profiles
  has_many :schedule
  mount_uploader :planner_profile,PlannerProfileUploader
  def workshops
    return Workshop.where(planner_id: self.id)
end
end
