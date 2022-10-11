class CreatePlanners < ActiveRecord::Migration[5.2]
  def change
    create_table :planners do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :birthday
      t.string :gender

      t.timestamps
    end
  end
end
