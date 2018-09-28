class RemoveImageFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :image, :string
  end
end
