class Product < ApplicationRecord
	attachment :image

    belongs_to :artist, optional: true, inverse_of: :products
    belongs_to :category, optional: true, inverse_of: :products

    has_many :discs, dependent: :destroy, inverse_of: :product
    # has_many :songs, dependent: :destroy, :through => :disc
    accepts_nested_attributes_for :discs, allow_destroy: true

	has_many :cart_items, dependent: :destroy
	has_many :carts, :through => :cart_items

	has_many :reviews, dependent: :destroy
	has_many :users, :through => :reviews

    validates :artist_id, presence: true
    validates :category_id, presence: true
    validates :title, presence: true
    validates :label, presence: true
    validates :price, presence: true
    validates :stock, presence: true

    validates :price, numericality: {
            only_integer: true, greater_than_or_equal_to: 0
          }
    validates :stock, numericality: {
            only_integer: true, greater_than_or_equal_to: 0
          }

    # default_scope -> { order(ranking: :asc) }


        def posted_by?(cart)
          cart_items.where(cart_id: cart.id).exists?
        end

end


