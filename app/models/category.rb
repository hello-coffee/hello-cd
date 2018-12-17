class Category < ApplicationRecord

	has_many :products, dependent: :destroy
    has_many :artists, :through => :products
end
