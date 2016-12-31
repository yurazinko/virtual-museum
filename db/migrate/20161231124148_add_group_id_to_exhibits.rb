class AddGroupIdToExhibits < ActiveRecord::Migration[5.0]
  def change
    add_column :exhibits, :group_id, :integer
    add_index :exhibits, :group_id
  end
end
