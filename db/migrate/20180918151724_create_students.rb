class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
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
      t.string :password

      t.timestamps
    end
  end
end
