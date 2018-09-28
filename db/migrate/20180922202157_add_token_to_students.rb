class AddTokenToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :auth_token, :string
  end
end
