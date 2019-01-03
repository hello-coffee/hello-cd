class AddRankingToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :ranking, :integer
  end
end
