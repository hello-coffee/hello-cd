class Product < ApplicationRecord
	attachment :image

    belongs_to :artist, optional: true, inverse_of: :products
    belongs_to :category, optional: true, inverse_of: :products

    has_many :discs, dependent: :destroy, inverse_of: :product
    has_many :songs, dependent: :destroy, :through => :disc
    accepts_nested_attributes_for :discs, allow_destroy: true

	has_many :cart_items, dependent: :destroy
	has_many :carts, :through => :cart_items

	has_many :reviews, dependent: :destroy
	has_many :users, :through => :reviews
end
