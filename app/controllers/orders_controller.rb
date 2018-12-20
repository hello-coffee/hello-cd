class OrdersController < ApplicationController

  def new
  	@addresses = current_user.addresses
  	@orders = Order.all
    #firstをlastに変える
    @cart = current_user.carts.first

    @price = current_user.carts
    @total_price = 0
    @price.cart_items.each do |cart_item|
      @total_price += cart_item.product.price * cart_item.quantity
    end

    @order = Order.new
  end

  def create
  	if
  		@address.save
  		@order.save
  		redirect_to user_path
  	else
  		render :new
  	end
  end

  def index
    @orders = Orders.page(params:[page]).per(10)
  end
end

