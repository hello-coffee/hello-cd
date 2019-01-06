class FavoriteArtist < ApplicationRecord

	validates :user_id, :uniqueness => {:scope => :artist_id}

	belongs_to :artist, optional: true
	belongs_to :user, optional: true


end
