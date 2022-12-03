class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :planner_id
      t.string :planner_profile

      t.timestamps
    end
  end
end
