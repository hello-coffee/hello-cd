class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :post_code
      t.string :addres
      t.string :tel
      t.string :email
      t.string :password
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
