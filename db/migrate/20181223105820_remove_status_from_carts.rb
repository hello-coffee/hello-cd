class RemoveStatusFromCarts < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :status, :integer
  end
end
