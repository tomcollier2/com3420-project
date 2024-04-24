class CreateInstrumentsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments do |t|
      t.belongs_to :tutors
      t.belongs_to :students
      t.string :instrument
      t.timestamps
    end
  end
end
