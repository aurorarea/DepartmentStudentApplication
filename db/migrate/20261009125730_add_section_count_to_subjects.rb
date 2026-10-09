class AddSectionCountToSubjects < ActiveRecord::Migration[8.1]
  def change
    add_column :subjects, :sectionCount, :integer
  end
end
