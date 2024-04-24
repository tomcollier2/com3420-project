class RemoveUsernameAndPasswordFromStudent < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :username, :string
    remove_column :students, :password, :string
  end
end
