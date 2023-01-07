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
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :start_date
      t.datetime :end_date
      t.string :personnel
      t.text :precautions
      t.timestamps
    end
  end
end
