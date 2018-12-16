class Product < ApplicationRecord
	attachment :image

    belongs_to :artist

    belongs_to :category

    has_many :discs, dependent: :destroy

end
