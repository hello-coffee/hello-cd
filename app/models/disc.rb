class Disc < ApplicationRecord

	belong to :product

    has_many :songs, dependent: :destroy

end
