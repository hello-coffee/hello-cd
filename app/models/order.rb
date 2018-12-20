class Order < ApplicationRecord

	belongs_to :user
	enum status: [:ordered, :standby, :shipped]

end
