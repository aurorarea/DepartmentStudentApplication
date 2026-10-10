class AddCountsToDepartments < ActiveRecord::Migration[8.1]
  def change
    add_column :departments, :studentsCount, :integer
    add_column :departments, :teachersCount, :integer
    add_column :departments, :laboratory, :integer
  end
end
