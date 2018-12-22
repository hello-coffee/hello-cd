class PostCodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, '郵便番号は、数字3桁＋ハイフン（-）＋数字4桁の形式で入力してください。') unless value =~ /\A[0-9]{3}-[0-9]{4}\z/
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  	validates :password,
  	format: { with: /\A[a-zA-Z]+\z/,
    message: "パスワードは、英文字のみが使用できます。" }

    validates :post_code,
    post_code: true
    validates :email,
    presence: true
  	acts_as_paranoid

	has_many :reviews, dependent: :destroy
	has_many :products, :through => :reviews

	has_many :addresses, dependent: :destroy

    has_many :orders, dependent: :destroy

	has_many :favorite_artists
	has_many :artists, :through => :favorite_artists

	has_many :carts

end
