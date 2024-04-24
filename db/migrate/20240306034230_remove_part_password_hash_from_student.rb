class RemovePartPasswordHashFromStudent < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :passwordHash, :string
  end
end
