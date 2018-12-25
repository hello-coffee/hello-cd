class Artist < ApplicationRecord

    has_many :products, dependent: :destroy, inverse_of: :artist
    accepts_nested_attributes_for :products, allow_destroy: true
	has_many :categories, :through => :products

	# has_and_belongs_to_many :users

	has_many :favorite_artists
  	has_many :users, through: :favorite_artists

        def favorited_by?(user)
          favorite_artists.where(user_id: user.id).exists?
        end

end
