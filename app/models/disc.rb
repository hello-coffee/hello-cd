class Disc < ApplicationRecord

	belongs_to :product, optional: true, inverse_of: :discs

    has_many :songs, dependent: :destroy, inverse_of: :disc
    accepts_nested_attributes_for :songs, allow_destroy: true

    # songs.each{ |song| song.mark_for_destruction if song.song_name.blank? }

    validates :disc_name, presence: true


end
