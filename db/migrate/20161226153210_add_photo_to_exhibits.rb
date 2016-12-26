class AddPhotoToExhibits < ActiveRecord::Migration[5.0]
  def change
    add_column :exhibits, :photo, :string
  end
end
