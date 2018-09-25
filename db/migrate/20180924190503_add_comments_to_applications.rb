class AddCommentsToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :dean_comment, :string
    add_column :applications, :hod_comment, :string
    add_column :applications, :warden_comment, :string
    add_column :applications, :finance_comment, :string
    add_column :applications, :librarian_comment, :string
    remove_column :applications, :comments, :string
  end
end
