class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :planner_id
      t.integer :workshop_id
      t.string :title
      t.string :content
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
