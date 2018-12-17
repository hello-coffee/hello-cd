class ProductsController < ApplicationController
  
    def index
      @user = current_user
    end

    def show
    end

    def update
    end

    def destroy
    end

    def edit
    end

    def new
        @category = Category.new
        @artist = Artist.new
        @product = Product.new
    end

    def create
        @product = Product.new(post_image_params) #paramsでは、フォームで入力されたデータが投稿データとして許可されているパラメータかチェックしている
        @product.save
        redirect_to product_path(@product.id)
    end

    private
        def product_params
            params.require(:product).permit(:artist_id, :title, :image, :price, :label, :category_id, :stock, :deleted_at)
        end

end
