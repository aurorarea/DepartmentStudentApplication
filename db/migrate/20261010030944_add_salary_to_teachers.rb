class AddSalaryToTeachers < ActiveRecord::Migration[8.1]
  def change
    add_column :teachers, :monthlySalary, :float
    add_column :teachers, :perUnitRate, :float
  end
end
