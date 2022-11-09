class CreateWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_table :workshops do |t|
      t.string :w_title
      t.string :w_theme
      t.string :firstname
      t.string :lastname
      t.string  :f_name_E
      t.string :l_name_E
      t.string :image
      t.string :prefecture
      t.string :address1
      t.string :address2
      t.integer  :planner_id
      t.text :w_detail
      t.text :p_text
      t.text :p_detail
      t.string :profile_img
      t.string :time
      t.string :personnel
      t.text :precautions

      t.timestamps
    end
  end
end
