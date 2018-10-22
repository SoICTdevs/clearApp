class AddPasswordDigestToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :password_digest, :string
    remove_column :students, :password_salt, :string
    remove_column :students, :password_hash, :string
  end
end
