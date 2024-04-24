class CreateMusicSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :music_sessions do |t|
      t.belongs_to :tutor
      t.string :title
      t.string :description
      t.datetime :due_date
      t.timestamps
    end
  end
end
