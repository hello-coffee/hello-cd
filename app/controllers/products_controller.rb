class ProductsController < ApplicationController

    def index
        @products = Product.page(params[:page]).per(4).order(:id)
        @news = News.all.page(params[:page]).per(5).reverse_order
        @categories = Category.all
        @search = Product.ransack(params[:q])
    end

    def show
        @product = Product.find(params[:id])
        @discs = @product.discs
        # disc = @product.discs.build
        # disc.songs.build
        # @disc = @product.disc
        # @discs = Disc.all
        # @artist = Artist.find(params[:id])
            @favorite_artist = FavoriteArtist.new
            @artist = @product.artist

            @cart_item = CartItem.new

        @reviews = @product.reviews.page(params[:page]).reverse_order

        @favorite_artists = FavoriteArtist.all
        @search = Product.ransack(params[:q])


    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to product_path(@product.id), notice: "Book was successfully updated."
        else
            render "edit"
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_path, notice: "Book was successfully destroyed."
    end

    def edit
        @artist = Artist.new
        @category = Category.new

        @product = Product.find(params[:id])
    end

    def new
        @artist = Artist.new
        @category = Category.new
        # @product = Product.new
        # disc = @product.discs.build
        # @product.discs.build
        # disc.songs.build
        # @product.discs.songs.build #追加

        @product = Product.new
        @disc = @product.discs.build
        @song = @disc.songs.build
    end

    def create
        # @artist = Artist.new(artist_params)
        # @artist = Artist.find(params[:artist_id])

        @product = Product.new(product_params)
        # @product.artist_id = @artist.id
        @product.save
        redirect_to product_path(@product.id)
    end

    private
        def product_params
            params.require(:product).permit(:artist_id, :title, :image, :price, :label, :category_id, :deleted_at, :stock, :page,
             discs_attributes: [:id, :disc_name, :product_id, :_destroy,
              songs_attributes: [:id, :disc_id, :song_name, :song_sort, :_destroy]])
        end

  def artist_params
      params.require(:artist).permit(:artist_name)
  end

end
