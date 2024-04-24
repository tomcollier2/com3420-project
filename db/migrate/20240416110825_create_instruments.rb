class CreateInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments do |t|
      t.belongs_to :tutor
      t.belongs_to :student
      t.string :instrument
      t.timestamps
    end
  end
end
