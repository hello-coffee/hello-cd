class Song < ApplicationRecord

    belongs_to :disc, inverse_of: :songs

    default_scope -> { order(song_sort: :asc) }

    validates :song_name, presence: true
    validates :song_sort, presence: true

    validates :song_sort, numericality: true


end
