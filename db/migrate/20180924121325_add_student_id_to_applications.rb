class AddStudentIdToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :student_id, :integer
  end
end
