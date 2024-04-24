class DropInstrumentsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :instruments
  end
end
