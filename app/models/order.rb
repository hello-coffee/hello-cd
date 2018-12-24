class Order < ApplicationRecord
	belongs_to :user
	has_one :cart
	enum status: [:ordered, :standby, :shipped]
end
