class CreateAvatars < ActiveRecord::Migration[7.0]
  def change
    create_table :avatars do |t|
      t.string :file_location
      t.integer :cost
      t.timestamps
    end
  end
end
