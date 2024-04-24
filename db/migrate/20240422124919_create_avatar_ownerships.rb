class CreateAvatarOwnerships < ActiveRecord::Migration[7.0]
  def change
    create_table :avatar_ownerships do |t|
      t.string :avatar
      t.string :fileLocation
      t.boolean :active
      t.timestamps 
    end
  end
end
