class RemoveColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :applications, :is_dean_approve, :boolean
    remove_column :applications, :is_hod_approve, :boolean
    remove_column :applications, :is_finance_approve, :boolean
    remove_column :applications, :is_warden_approve, :boolean
    remove_column :applications, :is_librarian_approve, :boolean

    add_column :applications, :is_dean_approve, :integer
    add_column :applications, :is_hod_approve, :integer
    add_column :applications, :is_finance_approve, :integer
    add_column :applications, :is_warden_approve, :integer
    add_column :applications, :is_librarian_approve, :integer
  end

end
