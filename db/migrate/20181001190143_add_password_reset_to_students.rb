class AddPasswordResetToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :password_reset_token, :string
    add_column :students, :password_reset_sent_at, :datetime
  end
end
