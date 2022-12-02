class CreateProfilePs < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_ps do |t|
      t.string :planner_profile

      t.timestamps
    end
  end
end
