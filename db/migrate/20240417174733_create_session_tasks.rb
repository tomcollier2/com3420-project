class CreateSessionTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :session_tasks do |t|
      t.belongs_to :session
      t.string :title
      t.string :description
      t.integer :reward
      t.integer :time
      t.timestamps
    end
  end
end
