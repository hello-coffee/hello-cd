class Artist < ApplicationRecord

	has_many :products, dependent: :destroy
	has_many :categories, :through => :products

	has_and_belongs_to_many :users

end
