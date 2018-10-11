class RemoveDepartmentToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :department, :string
    remove_column :users, :school, :string
    add_column :users, :department_id, :integer
    add_column :users, :school_id, :integer
  end
end
