class ProductsController < ApplicationController

    before_action :authenticate_admin!, only: [:new, :edit]

    def index
        @products = Product.page(params[:page]).per(9).order(id: "DESC")
        @news = News.all.page(params[:page]).per(5).reverse_order
        @categories = Category.all
        @search = Product.ransack(params[:q])

        #===
        # @product_rankings = Product.all
        @product_rankings = Product.order(ranking: "DESC").limit(3)


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

        @categories = Category.all
        @search = Product.ransack(params[:q])

        @product_rankings = Product.order(ranking: "DESC").limit(3)

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

        # if @artist.present?

            # @product = Product.new
            # disc = @product.discs.build
            # @product.discs.build
            # disc.songs.build
            # @product.discs.songs.build #追加

            # @product = Product.new
            # @disc = @product.discs.build
            # @song = @disc.songs.build

        # else
            @artist = Artist.new
            @category = Category.new
            @product = Product.new
            @disc = @product.discs.build
            @song = @disc.songs.build
        # end

    end

    def create
        # @artist = Artist.new(artist_params)
        # @artist = Artist.find(params[:artist_id])

        @product = Product.new(product_params)
        # @product.artist_id = @artist.id
        if @product.save
            redirect_to product_path(@product.id), notice: "Product was successfully created."
        else
            @artist = Artist.new
            @category = Category.new
            @products = Product.all
          render 'products/new'
        end
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
