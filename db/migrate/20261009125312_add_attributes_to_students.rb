class AddAttributesToStudents < ActiveRecord::Migration[8.1]
  def change
    add_column :students, :tuitionFee, :float
    add_column :students, :subjectsCount, :integer
    add_column :students, :numberOfUnits, :integer
  end
end
