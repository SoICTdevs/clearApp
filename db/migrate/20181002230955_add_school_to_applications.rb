class AddSchoolToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :school, :string
  end
end
