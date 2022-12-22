class Workshop < ApplicationRecord
  #validates :w_title,:w_theme,:image,:prefecture,:address1,:address2,:planner_id,:w_detail,:p_text,:p_detail,:profile_img,:time,:personnel,:precautions,{presence: true}
    mount_uploader :image, WorkshopPhotoUploader 
  #workshopと別にプロフィールイメージ作成してみる 
    belongs_to :planner,class_name: "Planner",optional: true 
    belongs_to :user,class_name:"User",optional: true
    has_many :posts#, dependent::destroy
    has_many :star, class_name:"Star",optional: true
    def avg_score
        unless self.workshops.empty?#workshopsが空では無かったら下記を返す。
          workshops.average(:score).round(1).to_f
        else
          0.0
        end
    end
    def review_score_percentage 
        unless self.workshops.empty?#パーセンテージ
          workshops.average(:score).round(1).to_f*100/5
        else
          0.0
        end
    end
end

