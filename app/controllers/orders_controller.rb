class OrdersController < ApplicationController

  def new

    #@address = current_user.carts.address_id
    @user = User.find(current_user[:id])
    @cart = current_user.carts.last
    #address.id = @cart.address_id
    @address = Address.find(@cart.address_id)

    @order = Order.new
     #firstをlastに変える


    @price = current_user.carts.last
    @total_price = 0
    @price.cart_items.each do |cart_item|
      @total_price += cart_item.product.price * cart_item.quantity
    end

    #if redirect.blank?
      #@address = Address.new
    #else
      #@address = Address.find(parems[:address_id])
      #redirect_to 'new', redirect: true, address_id: params[:address_id]
    #end
  end

  def create
    if
      @order = Order.new(order_params)
#binding.pry

      @order.status = 0
      @order.user_id = current_user.id

      #@order.address = @address.address
      #@order.cart_id = current_user.carts.first.id
      # ======「total_priceの計算」==========
      #@price = current_user.carts.first
      #@total_price = 0
      #@price.cart_items.each do |cart_item|
        #@total_price += cart_item.product.price * cart_item.quantity
      #end
      # ================
      #@order.total_price = @total_price

  		@order.save
  		redirect_to user_path(current_user.id)

          @cart = Cart.new
          @cart.user_id = current_user.id
          @cart.save

    else
  		redirect_to new_order_path
  	end
  end

  def index
    @order = Order.all
  end

  private
    def order_params
      params.require(:order).permit(:user_id, :cart_id, :status, :pay, :total_price, :address)
    end

end

