class RemovePasswordHashFromTutor < ActiveRecord::Migration[7.0]
  def change
    remove_column :tutors, :passwordHash, :string
  end
end
