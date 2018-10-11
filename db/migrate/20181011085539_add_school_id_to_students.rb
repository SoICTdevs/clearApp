class AddSchoolIdToStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :school, :string
    remove_column :students, :department, :string
  end
  def change
    add_column :students, :school_id, :integer
    add_column :students, :department_id, :integer
  end
end
