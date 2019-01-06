class ArtistsController < ApplicationController

      before_action :authenticate_admin! ,except: [:show]


  def index
      @artists = Artist.all
  end

  def new
      @artist = Artist.new
      @product = @artist.products.build
      @disc = @product.discs.build
      @song = @disc.songs.build

  end

  def create
      @artist = Artist.new(artist_params)
      if @artist.save
          # @product.artist_id = @artist.id
          # @product.save

          redirect_to new_product_path, notice: "アーティストが追加されました"
      else
          @artists = Artist.all
          @category = Category.new
          @product = Product.new
          @disc = @product.discs.build
          @song = @disc.songs.build
          render 'products/new'
      end
  end

  def show
  		@artist = Artist.find(params[:id])
  		@products = @artist.products.page(params[:page]).per(9).reverse_order
  		@categories = Category.all
      @search = Product.ransack(params[:q])
      @product_rankings = Product.order(ranking: "DESC").limit(3)
  end

    def update
        @artist = Artist.find(params[:id])
        if @artist.update(artist_params)
            redirect_to artist_path(@artist.id), notice: ""
        else
            render "edit"
        end
    end

    def destroy
        @artist = Artist.find(params[:id])
        @artist.destroy
        redirect_to artists_path, notice: ""
    end

    def edit
        @artist = Artist.find(params[:id])
    end


private
      def search_params
      	params.require(:q).permit(:name_cont)
      end

      def artist_params
          params.require(:artist).permit(:artist_name,
           products_attributes: [:id, :artist_id, :title, :image, :price, :label, :categoty_id, :deleted_at, :stock, :_destroy,
            discs_attributes: [:id, :disc_name, :product_id, :_destroy,
             songs_attributes: [:id, :disc_id, :song_name, :song_sort, :_destroy]]])
      end

      # def product_params
      #     params.require(:product).permit(:artist_id, :title, :image, :price, :label, :categoty_id, :deleted_at, :stock,
      #      discs_attributes: [:id, :disc_name, :product_id, :_destroy,
      #       songs_attributes: [:id, :disc_id, :song_name, :song_sort, :_destroy]])
      # end


end





