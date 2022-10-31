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
      t.string :planner_id
      t.timestamps
    end
  end
end
