class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :w_title
      t.string :w_theme
      t.string :image
      t.string :firstname
      t.string :lastname
      t.string :f_name_E
      t.string :l_name_E
      t.timestamps
    end
  end
end
