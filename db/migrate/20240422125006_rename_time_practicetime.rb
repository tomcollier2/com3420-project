class RenameTimePracticetime < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :time, :practice_time
    add_column :tasks, :record_time, :int
  end
end
