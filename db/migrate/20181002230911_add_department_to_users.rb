class AddDepartmentToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :department, :string
    add_column :users, :school, :string
  end
end
