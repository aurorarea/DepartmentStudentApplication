class AddStudentsCountToSections < ActiveRecord::Migration[8.1]
  def change
    add_column :sections, :studentsCount, :integer
  end
end
