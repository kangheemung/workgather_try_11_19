class CreateUserWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_table :user_workshops do |t|
      t.integer :user_id
      t.integer :workshop_id

      t.timestamps
    end
  end
end
