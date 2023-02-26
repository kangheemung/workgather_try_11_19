class Post < ApplicationRecord
    mount_uploader :image, PostImageUploader
    validates :title,:image,:content,{presence: true}
    belongs_to :user,class_name: "User"
    belongs_to :user_workshop
    def user
        return User.find_by(id: self.user_id)
    end

end