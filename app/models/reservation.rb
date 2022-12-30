class Reservation < ApplicationRecord
    belongs_to :user ,class_name: "User"
    belongs_to :workshops,class_name: "Workshop"

    def date_before_start
      errors.add(:day, "は過去の日付は選択できません") if day < Date.current
    end
    
    def date_current_today
      errors.add(:day, "は当日は選択できません。予約画面から正しい日付を選択してください。") if day < (Date.current + 1)
    end
    
    def date_three_month_end
      errors.add(:day, "は3ヶ月以降の日付は選択できません") if (Date.current >> 3) < day
    end
end
