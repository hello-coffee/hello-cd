class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :artist_id
      t.string :title
      t.string :image_id
      t.integer :price
      t.string :label
      t.integer :category_id
      t.integer :stock
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
