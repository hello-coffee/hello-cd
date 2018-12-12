class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :subject
      t.text :review
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
