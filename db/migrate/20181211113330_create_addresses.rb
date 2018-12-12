class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :name_kana
      t.string :post_code
      t.string :address
      t.string :tel
      t.string :email

      t.timestamps
    end
  end
end
