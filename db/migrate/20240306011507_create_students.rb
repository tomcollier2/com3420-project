class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :studentID
      t.string :forename
      t.string :surname
      t.string :username
      t.string :passwordHash
      t.string :experience
      t.integer :coins
      t.integer :dayStreak
      t.string :avatarID

      t.timestamps
    end
  end
end
