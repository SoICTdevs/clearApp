class RemoveSchoolToStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :school, :string
    remove_column :students, :department, :string
  end
end
