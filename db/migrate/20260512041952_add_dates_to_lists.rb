class AddDatesToLists < ActiveRecord::Migration[8.1]
  def change
    add_column :lists, :starts_at, :datetime
    add_column :lists, :ends_at, :datetime
  end
end
