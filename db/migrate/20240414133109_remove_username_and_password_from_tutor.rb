class RemoveUsernameAndPasswordFromTutor < ActiveRecord::Migration[7.0]
  def change
    remove_column :tutors, :username, :string
    remove_column :tutors, :password, :string
  end
end
