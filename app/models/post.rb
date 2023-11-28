class Post < ApplicationRecord
      # タイトルと内容の存在を検証
      validates :title, presence: { message: 'タイトルを入力してください' },
      length: { minimum: 5, maximum: 100, too_short: 'タイトルは最低%{count}文字必要です', too_long: 'タイトルは最大%{count}文字までです' }
      validates :content, presence: { message: '内容を入力してください' },
        length: { minimum: 10, maximum: 1000, too_short: '内容は最低%{count}文字必要です', too_long: '内容は最大%{count}文字までです' }
        validates :image, presence: { message: '画像をアップロードしてください' }
        validates :title, :image, :content, { presence: true }
  # 画像もアップロードされていることを確認する場合、CarrierWaveやActiveStorageのようなファイル添付ライブラリが必要です。
  # 以下はActiveStorageを使用した例です:

 

    mount_uploader :image, PostImageUploader
    validates :title,:image,:content,{presence: true}
    belongs_to :user,class_name: "User"
    #belongs_to :workshop
    has_many :workshop_posts, dependent: :destroy
    has_many :workshops, through: :workshop_posts
    belongs_to :workshop


end