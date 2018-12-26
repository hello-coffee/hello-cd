class AdminsController < ApplicationController

	def show
		@all_user = User.all.page(params[:page]).per(10)
		@all_product = Product.all.page(params[:page]).per(10)
		@news = News.new
	end

end
