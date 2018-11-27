class RemovePasswordhashFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password_hash, :string
    remove_column :users, :password_salt, :string
  end
end
