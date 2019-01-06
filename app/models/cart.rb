class Cart < ApplicationRecord

	has_many :cart_items, dependent: :destroy
	has_many :products, :through => :cart_items

	has_one :order

	belongs_to :user


end
