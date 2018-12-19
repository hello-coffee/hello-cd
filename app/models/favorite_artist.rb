class FavoriteArtist < ApplicationRecord


	validates :user_id, :uniqueness => {:scope => :artist_id}

	belongs_to :artist
	belongs_to :user


end
