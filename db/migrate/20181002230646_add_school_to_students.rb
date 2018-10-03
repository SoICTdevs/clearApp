class AddSchoolToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :school, :string
  end
end
