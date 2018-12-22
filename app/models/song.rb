class Song < ApplicationRecord

    belongs_to :disc, inverse_of: :songs

    default_scope -> { order(song_sort: :asc) }

end
