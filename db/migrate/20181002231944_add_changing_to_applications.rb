class AddChangingToApplications < ActiveRecord::Migration[5.2]
  def change

    remove_column :applications, :is_dean_approve, :integer
    remove_column :applications, :is_hod_approve, :integer
    remove_column :applications, :is_finance_approve, :integer
    remove_column :applications, :is_warden_approve, :integer
    remove_column :applications, :is_librarian_approve, :integer

    add_column :applications, :is_dean_approve, :integer, :default => 2
    add_column :applications, :is_hod_approve, :integer, :default => 2
    add_column :applications, :is_finance_approve, :integer, :default => 2
    add_column :applications, :is_warden_approve, :integer, :default => 2
    add_column :applications, :is_librarian_approve, :integer, :default => 2
  end
end
