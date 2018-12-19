class CategoriesController < ApplicationController

  def show
  	@category = Category.find(params[:id])
  	@products = @category.products.page(params[:page]).per(9).reverse_order

  	@categories = Category.all

  	# 検索オブジェクト
  	@search = Artist.ransack(params[:q])
  	# 検索結果
  	@result = @search.result(distinct: true).includes(:products)
  	#render :index
  end

  private
  def search_params
  	params.require(:q).permit(:name_cont)
  end
end

