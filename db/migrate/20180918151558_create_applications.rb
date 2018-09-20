class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.integer :reg_number
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :telephone
      t.string :sex
      t.string :department
      t.integer :level
      t.string :academic_year
      t.string :sponsor
      t.boolean :is_dean_approve
      t.boolean :is_hod_approve
      t.boolean :is_warden_approve
      t.boolean :is_librarian_approve
      t.boolean :is_finance_approve

      t.timestamps
    end
  end
end
