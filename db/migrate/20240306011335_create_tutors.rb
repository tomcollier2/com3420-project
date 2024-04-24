class CreateTutors < ActiveRecord::Migration[7.0]
  def change
    create_table :tutors do |t|
      t.string :tutorID
      t.string :forename
      t.string :surname
      t.string :username
      t.string :passwordHash
      t.boolean :admin

      t.timestamps
    end
  end
end
