class ProductsController < ApplicationController

    def index
    end

    def show
        @product = Product.find(params[:id])
        @discs = @product.discs
        # disc = @product.discs.build
        # disc.songs.build
        # @disc = @product.disc
        #@discs = Disc.all
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
        @product = Product.find(params[:id])
    end

    def new
        # @artist = Artist.new
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
        @product = Product.new(product_params)
        @product.save
        redirect_to product_path(@product.id)
    end

    private
        def product_params
            params.require(:product).permit(:artist_id, :title, :image, :price, :label, :categoty_id, :deleted_at, :stock, discs_attributes: [:id, :disc_name, :product_id, :_destroy, songs_attributes: [:id, :disc_id, :song_name, :song_sort, :_destroy]])
        end
end
