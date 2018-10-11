class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :full_name
      t.integer :school_id

      t.timestamps
    end
  end
end
