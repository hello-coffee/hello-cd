class CategoriesController < ApplicationController


  def create
      @category = Category.new(category_params)
      @category.save
        redirect_to new_product_path
  end


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

      def category_params
          params.require(:category).permit(:category_name,
           products_attributes: [:id, :artist_id, :title, :image, :price, :label, :categoty_id, :deleted_at, :stock, :_destroy,
            discs_attributes: [:id, :disc_name, :product_id, :_destroy,
             songs_attributes: [:id, :disc_id, :song_name, :song_sort, :_destroy]]])
      end


end

