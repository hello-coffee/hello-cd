class CartItemsController < ApplicationController

    def create

		@product = Product.find(params[:product_id])
	  	@cart_item = @product.cart_items.new
	  	@cart_item.cart_id = params[:cart_id]
	  	@cart_item.quantity = params[:cart_item][:quantity]
	  	@cart_item.buy_price = @product.price
	  	@cart_item.save
	  	redirect_to cart_path(current_user.carts.ids)


    end

    def destroy
    end
end
