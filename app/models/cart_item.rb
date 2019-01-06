class CartItem < ApplicationRecord

	validates :cart_id, :uniqueness => {:scope => :product_id}


    belongs_to :product
    belongs_to :cart


end
