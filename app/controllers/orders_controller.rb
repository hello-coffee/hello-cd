class OrdersController < ApplicationController

  def new
    @address = Address.new
  	#@addresses = current_user.addresses
  	#@orders = Order.all
     #firstをlastに変える
    @cart = current_user.carts.first

    @price = current_user.carts.first
    @total_price = 0
    @price.cart_items.each do |cart_item|
      @total_price += cart_item.product.price * cart_item.quantity
    end
    @order = Order.new
  end

  def create
  	if
      @address = Address.new(address_params)
      @order = Order.new(order_params)
  		@address.save
binding.pry
      @order.status = 0
      @order.user_id = current_user.id
      @order.cart_id = current_user.carts.first
      # ======「total_priceの計算」==========
      @price = current_user.carts.first
      @total_price = 0
      @price.cart_items.each do |cart_item|
        @total_price += cart_item.product.price * cart_item.quantity
      end
      # ================
      @order.total_price = @total_price

  		@order.save
  		redirect_to user_path(current_user.id)
  	else
  		redirect_to new_order_path
  	end
  end

  def index
    #@orders = Orders.page(params:[page]).per(10)
  end

  private

    def address_params
      params.require(:address).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :tel, :email)
    end

    def order_params
      params.require(:order).permit(:user_id, :cart_id, :status, :pay, :total_price, :address)
    end

end