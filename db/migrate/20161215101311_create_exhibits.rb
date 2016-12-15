class CreateExhibits < ActiveRecord::Migration[5.0]
  def change
    create_table :exhibits do |t|
      t.string :name
      t.string :fond_group
      t.string :section
      t.integer :collection_number
      t.integer :inventory_number
      t.integer :another_inv_num
      t.integer :photo_number
      t.string :dating
      t.string :material
      t.string :size_or_weight
      t.string :condition
      t.boolean :renewal
      t.string :date_of_renewal
      t.string :storage_location
      t.string :locality
      t.string :museum_director
      t.string :custodian
      t.string :date_of_receipt
      t.integer :act_of_reception_num

      t.timestamps
    end
  end
end