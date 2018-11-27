class AddDepandschollToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :department, :string
    add_column :users, :school, :string
    remove_column :users, :school_id, :integer
    remove_column :users, :department_id, :integer
  end
end
