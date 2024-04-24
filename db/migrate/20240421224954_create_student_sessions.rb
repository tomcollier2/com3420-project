class CreateStudentSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :student_sessions do |t|
      t.belongs_to :student
      t.belongs_to :music_session
      t.boolean :completed
      t.datetime :time_completed
      t.integer :rating
      t.string :notes
      t.timestamps
    end
  end
end
