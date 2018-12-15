class CategoriesController < ApplicationController
  def show
  	@category = Category.find(params[:id])
  	@products = @category.products.page(params[:page]).per(9).reverse_order
  end
end
