class Post < ApplicationRecord
    mount_uploader :image, PostImageUploader
    validates :title,:image,:content,{presence: true}
    belongs_to :user,class_name: "User"
    #belongs_to :workshop
    has_many :workshop_posts, dependent: :destroy
    has_many :workshops, through: :workshop_posts



end