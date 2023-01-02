class  Reservation < ApplicationRecord
  #validates :title,:image,:content,{presence: true}
  belongs_to :user,class_name:"User",optional: true
  belongs_to :user_workshop
  belongs_to :workshop
end
