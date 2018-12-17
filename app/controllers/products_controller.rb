class ProductsController < ApplicationController
  
    def index
      @user = current_user
    end

    def show
        @product = Product.find(params[:id])
        @discs = @product.discs
        #@discs = Disc.all
    end

    def update
    end

    def destroy
    end

    def edit
    end

    def new
        # @artist = Artist.new
        @product = Product.new
        @product.discs.build #追加
        # @product.discs.songs.build #追加
    end

    def create
        @product = Product.new(product_params)
        @product.save
        redirect_to product_path(@product.id)
    end

    private
        def product_params
            params.require(:product).permit(:artist_id, :title, :image, :price, :label, :categoty_id, :deleted_at, :stock, discs_attributes: [:id, :disc_name, :product_id])
        end

end
