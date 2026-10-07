class RemoveStringFromSections < ActiveRecord::Migration[8.1]
  def change
    remove_column :sections, :string, :string
  end
end
