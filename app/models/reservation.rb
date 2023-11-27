class Reservation < ApplicationRecord
    belongs_to :user ,foreign_key: "user_id", optional: true
    belongs_to :workshop, foreign_key: "workshop_id"
    validates :name, presence: true

    # 参加者数が整数であり、1以上であることを確認するバリデーション
    validates :participant, presence: { message: "記入してください。" }

  # 参加者数が整数であり、1以上であることを確認するバリデーション
   validates :participant, numericality: { only_integer: true, greater_than_or_equal_to: 1, message: "は1以上の整数で入力してください。" }, if: -> { participant.present? }

    # 日付/時間フィールドが未来の日時であることを確認するカスタムバリデーション
    validates :date_time_1,  presence: { message: "入力お願い致します。" }
    validates :date_time_1,  presence: { message: "入力お願い致します。" }
    validates :date_time_1, presence: { message: "入力お願い致します。" }
  
    # コロナ対策に同意していることを確認するバリデーション
    validates :check_box, acceptance: { accept: true }
   
end
 