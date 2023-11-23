class CreateWorkshopPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :workshop_posts do |t|
      t.references :workshop, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
