class DropSessionTask < ActiveRecord::Migration[7.0]
  def change
    drop_table :session_tasks
  end
end
