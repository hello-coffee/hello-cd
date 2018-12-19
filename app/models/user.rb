class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  acts_as_paranoid

	has_many :reviews, dependent: :destroy
	has_many :products, :through => :reviews

	has_many :addresses, dependent: :destroy

    has_many :orders, dependent: :destroy

	has_many :favorite_artists
	has_many :artists, :through => :favorite_artists

	has_many :carts

end
