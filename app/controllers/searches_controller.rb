class SearchesController < ApplicationController
  def search
  	@search = Product.ransack(params[:q])
    @products = @search.result
    @categories = Category.all
    @product_rankings = Product.order(ranking: "DESC").limit(3)
  end
end
