class Category < ApplicationRecord

    has_many :products, dependent: :destroy, inverse_of: :category
    accepts_nested_attributes_for :products, allow_destroy: true
    has_many :artists, :through => :products

end
