class Workshop < ApplicationRecord
  #validates :w_title,:w_theme,:image,:prefecture,:address1,:address2,:planner_id,:w_detail,:p_text,:p_detail,:profile_img,:time,:personnel,:precautions,{presence: true}
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
   
    def avg_score
      unless self.posts.empty?#workshopsが空では無かったら下記を返す。
        posts.average(:score).round(1).to_f
      else
        0.0
      end
    end
    def review_score_percentage 
      unless self.posts.empty?#パーセンテージ
        posts.average(:score).round(1).to_f*100/5
      else
        0.0
      end
    end
end

