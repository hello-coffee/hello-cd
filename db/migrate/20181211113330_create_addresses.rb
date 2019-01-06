class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :post_code
      t.string :address
      t.string :tel
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
