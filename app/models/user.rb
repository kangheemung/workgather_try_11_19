class User < ApplicationRecord
    validates :user_name, presence: true,uniqueness: { message: "入力お願い致します。" }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { 
        with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
        message: "正しいメールのアドレス入力して下さい。" 
      }
    validates :password, presence: true, 
    length: { minimum: 6, too_short: '6文字以下です' }, 
    allow_nil: true, presence: { message: "入力お願い致します。" }
    validates :password_confirmation, presence: true, length: { 
      minimum: 6, 
      too_short: '6文字以下です'
    }, allow_nil: true,presence: { message: "入力お願い致します。" }

    validates :u_profile_id, presence: { message: "写真選択お願い致します。" }
   
    validates :first_name, presence: { message: "入力お願い致します。" }
    validates :last_name, presence: { message: "入力お願い致します。" }
    validates :birthday, presence: { message: "入力お願い致します。" }
    validates :gender, presence: { message: "入力お願い致します。" }

    has_secure_password 
    mount_uploader :u_profile_id,UProfileIdUploader 
    #resource :user, only: %i[show edit update]
    has_many :posts, dependent: :destroy
    has_many :reservations,dependent: :destroy
    has_many :workshops, through: :reservations
    has_many :workshop_related_posts, through: :posts, source: :workshop
    has_many :images, class_name: "Image"


end
