class Disc < ApplicationRecord

	belongs_to :product,optional: true

    has_many :songs, dependent: :destroy
    accepts_nested_attributes_for :songs

end
