class RemoveSchoolToApplications < ActiveRecord::Migration[5.2]
  def change
    remove_column :applications, :school, :string
    remove_column :applications, :department, :string
  end
end
