class Address < ApplicationRecord

	belongs_to :user

	validates :last_name, presence: true
	validates :first_name, presence: true
	validates :last_name_kana, presence: true, format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/}
	validates :first_name_kana, presence: true, format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/}
	validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
	validates :address, presence: true, uniqueness: true
	validates :tel, presence: true, format: {with: /\A[0-9-]{,14}\z/}
	validates :email, presence: true

end
