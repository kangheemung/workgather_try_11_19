class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :workshop_id
      t.string :name
      t.integer :participant
      t.datetime :date_time_1
      t.datetime :date_time_2
      t.datetime :date_time_3
      t.boolean :check_box
      t.timestamps
    end
  end
end
