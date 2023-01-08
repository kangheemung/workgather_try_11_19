class CreateWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_table :workshops do |t|
      t.string :w_title
      t.string :w_theme
      t.string :image
      t.string :prefecture
      t.string :address1
      t.string :address2
      t.integer :planner_id
      t.text :w_detail
      t.time :start_time,null: false
      t.time :end_time,null: false
      t.date :start_date,null: false
      t.date :end_date,null: false
      t.string :personnel
      t.text :precautions
      t.timestamps
    end
  end
end
