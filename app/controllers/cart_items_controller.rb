class CartItemsController < ApplicationController

    def create

		@product = Product.find(params[:product_id])
	 #  	@cart_item = @product.cart_items.new
	 #  	@cart_item.cart_id = params[:cart_id]
	 #  	@cart_item.quantity = params[:cart_item][:quantity]
	 #  	@cart_item.buy_price = @product.price
	 #  	@cart_item.save
	 #  	redirect_to cart_path(current_user.carts.ids)

		if #Cart.find_by(user_id: current_user)
			#Cart.find_by(user_id: current_user.carts.last)
			#Cart.find_by(current_user.carts.last)
			#@cart = Cart.find_by(user_id: current_user)
			#Cart.present?
			current_user.carts.last.present?
		    @cart = current_user.carts.last
			@cart_item = CartItem.new(cart_item_params)
			@cart_item.cart_id = @cart.id
			@cart_item.product_id = @product.id
		  	@cart_item.buy_price = @product.price
			@cart_item.save
			redirect_to cart_path(@cart.id)
		else
			@cart = Cart.new
			@cart.user_id = current_user.id
			@cart.save
			@cart_item = CartItem.new(cart_item_params)
			@cart_item.cart_id = @cart.id
			@cart_item.product_id = @product.id
		  	@cart_item.buy_price = @product.price
			@cart_item.save
			redirect_to cart_path(@cart.id)
	    end
	end

    def destroy
    end

private
	def cart_params
		params.require(:cart).permit(:user_id)
	end
	def cart_item_params
		params.require(:cart_item).permit(:product_id, :cart_id, :buy_price, :quantity)
	end

end
