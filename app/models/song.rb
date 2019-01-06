class Song < ApplicationRecord

    belongs_to :disc, inverse_of: :songs

    default_scope -> { order(song_sort: :asc) }

    validates :song_name, presence: true
    validates :song_sort, presence: true

    # validates :song_sort, uniqueness: true

    validates :song_sort, numericality: {
            only_integer: true, greater_than_or_equal_to: 0
          }


end
