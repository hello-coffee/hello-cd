class Order < ApplicationRecord
	belongs_to :user
	has_one :cart
	enum status: {ordered: 0, standby: 1, shipped: 2}
end
