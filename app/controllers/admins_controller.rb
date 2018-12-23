class AdminsController < ApplicationController

	def show
		@all_user = User.all
		@all_product = Product.all
		@news = News.new
	end

end
