class AddColumnAddressToExhibits < ActiveRecord::Migration[5.0]
  def change
    add_column :exhibits, :address, :string
    add_column :exhibits, :latitude, :float
    add_column :exhibits, :longitude, :float
  end
end
