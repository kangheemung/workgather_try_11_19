class CreateStars < ActiveRecord::Migration[5.2]
  def change
    create_table :stars do |t|
      t.integer :score
      t.integer :user_id
      t.integer :workshop_id
      t.string :content
      t.integer :post_id
      t.timestamps
    end
  end
end
