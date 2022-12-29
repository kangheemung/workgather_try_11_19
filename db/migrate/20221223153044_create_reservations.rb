class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date "day", null: false
      t.string "time", null: false
      t.bigint "user_id", null: false
      t.integer :user_id
      t.integer :workshop_id
      t.integer :user_workshop_id
      t.datetime :start_time, null: false
      t.index ["user_id"], name: "index_reservations_on_user_id"

      t.timestamps
    end
  end
end
