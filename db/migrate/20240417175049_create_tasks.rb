class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :session
      t.string :title
      t.string :description
      t.integer :reward
      t.integer :time
      t.timestamps
    end
  end
end
