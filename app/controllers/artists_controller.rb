class ArtistsController < ApplicationController

  def index

  end

  def show
		# 検索オブジェクト
  		@search = Artist.ransack(params[:q])
  		# 検索結果
  		@result = @search.result(distinct: true).includes(:products)
  		#render :index

  		@artist = Artist.find(params[:id])
  		@products = @artist.products.page(params[:page]).per(9).reverse_order
  		@categories = Category.all
  end

private
  def search_params
  	params.require(:q).permit(:name_cont)
  end

end