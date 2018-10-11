class AddSchoolIdToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :school_id, :integer
    add_column :applications, :department_id, :integer
  end
end
