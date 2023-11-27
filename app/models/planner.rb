class Planner < ApplicationRecord
  validates :planner_name, presence: { message: "入力お願い致します。" }

  # Validates that email is present, unique and follows the specified format
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {
    with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
    message: "正しいメールのアドレス入力して下さい。"
  }

  # Validates that password is present, has a minimum length of 6 and can be nil (useful for updates, where you might not want to change the password)
  # There is a duplicate presence validation for the password.
  validates :password, presence: { message: "入力お願い致します。" },
                       length: { minimum: 6, too_short: '6文字以下です' },
                       allow_nil: true
  
  # Validates that password_confirmation is present and has a minimum length of 6
  # Removed the duplicate presence validation and the allow_nil option as it is unnecessary here.
  validates :password_confirmation, presence: { message: "入力お願い致します。" },
                                    length: { minimum: 6, too_short: '6文字以下です' }

  # Adds more attribute validations
  validates :planner_profile, presence: { message: "写真選択お願い致します。" }
  validates :p_detail, presence: { message: "入力お願い致します。" }
  validates :first_name, presence: { message: "入力お願い致します。" }
  validates :last_name, presence: { message: "入力お願い致します。" }
  validates :birthday, presence: { message: "入力お願い致します。" }
  validates :gender, presence: { message: "入力お願い致します。" }
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
