class AddPasswordToTutor < ActiveRecord::Migration[7.0]
  def change
    add_column :tutors, :password, :string
  end
end
