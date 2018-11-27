class AddDepcolumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :department_id, :integer
    add_column :users, :school_id, :integer
    remove_column :users, :department, :string
    remove_column :users, :school, :string
  end
end
