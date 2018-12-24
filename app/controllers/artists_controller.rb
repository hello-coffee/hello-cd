class ArtistsController < ApplicationController

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
      @artist.save
        redirect_to new_product_path

      # redirect_to artists_path, notice: ""

  end

  def show
  		@artist = Artist.find(params[:id])
  		@products = @artist.products.page(params[:page]).per(9).reverse_order
  		@categories = Category.all
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





