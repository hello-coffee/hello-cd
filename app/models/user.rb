class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_and_belongs_to_many :artists

	has_many :reviews, dependent: :destroy
	has_many :products, :through => :reviews

	has_many :addresses, dependent: :destroy

    has_many :orders, dependent: :destroy

	has_many :favorite_artists
	has_many :artists, :through => :favorite_artists

	has_many :carts


end
