class AddAddressIdToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :address_id, :integer
  end
end
