class AddPasswordToStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :password, :string
    add_column :students, :password_hash, :string
    add_column :students, :password_salt, :string
  end
end
