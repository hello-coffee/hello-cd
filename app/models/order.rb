class Order < ApplicationRecord
	belongs_to :user
	has_one :cart
	# enum status: {ordered: 0, standby: 1, shipped: 2}
  # enum main:[:beef, :fish, :pork, :lamb] # main dish
  	enum status:[:ordered, :standby, :shipped]



	validates :pay, acceptance: true
end
