class AddAncestryToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :ancestry, :string
  end
end
