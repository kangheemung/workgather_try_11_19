class Workshop < ApplicationRecord
  
  validates :w_title, presence: true, presence: { message: "入力お願い致します。" }
  validates :w_theme, presence: true, presence: { message: "入力お願い致します。" }
  validates :prefecture, presence: true, presence: { message: "入力お願い致します。" }
  validates :address1, presence: true, presence: { message: "入力お願い致します。" }
  validates :image, presence: true, presence: { message: "入力お願い致します。" }
  validates :w_detail, presence: true, presence: { message: "入力お願い致します。" }
  validates :start_time, presence: true, presence: { message: "入力お願い致します。" }
  validates :end_time, presence: true, presence: { message: "入力お願い致します。" }
  validates :start_date, presence: true, presence: { message: "入力お願い致します。" }
  validates :end_date, presence: true, presence: { message: "入力お願い致します。" }
 
  validates :precautions, presence: true, presence: { message: "入力お願い致します。" }
  
  # Add any other validations as per your requirements here...
  
  # For example, personnel should be a number greater than 0
 
  validates :personnel, presence: true, presence: { message: "入力お願い致します。" }
  



  
  # Add custom or additional methods as needed for your validations
  
  
  mount_uploader :image, WorkshopPhotoUploader 
  #workshopと別にプロフィールイメージ作成してみる 
    belongs_to :planner,class_name: "Planner",optional: true
    has_many :stars,class_name:"Star"
    has_many :user_workshops
    has_many :reservations, dependent: :destroy
    has_many :users,through: :reservations
    has_many :workshop_posts, dependent: :destroy
    has_many :posts, through: :workshop_posts
   
  
    

    def joined?(user)
      Reservation.where(user_id: user.id,workshop_id: self.id).exists?
    end
   
end

