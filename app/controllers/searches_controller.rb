class SearchesController < ApplicationController
  def search
  	@search = Product.ransack(params[:q])
    @products = @search.result
    @categories = Category.all
  end
end
