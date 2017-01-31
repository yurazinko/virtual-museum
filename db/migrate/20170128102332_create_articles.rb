class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :body
      t.integer :user_id
      
      t.timestamps
    end
  end
end