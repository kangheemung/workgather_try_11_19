class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image
      t.string :content
      t.integer :user_id
      t.integer :score
      t.integer :workshop_id
      t.integer :user_workshop_id
      t.timestamps
    end
  end
end
