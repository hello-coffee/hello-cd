class AdminsController < ApplicationController

	def show
		@all_user = User.all.page(params[:page]).per(10)
		@all_product = Product.all.page(params[:page]).per(10)
		@news = News.new
		@user = User.find(params[:id])
		@product = Product.find(params[:id])
	end

end
