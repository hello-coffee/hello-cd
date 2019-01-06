class OrdersController < ApplicationController

before_action :authenticate_user!, except: [:index, :update]
before_action :authenticate_admin!, only: [:index, :update]

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

      @cart = current_user.carts.last
      @cart.order_id = @order.id
      @cart.save

      #1 ===============

          @user = User.find(current_user[:id])
          # @history = History.new(history_params)
          @cc = @cart.cart_items
          @cc.each do |cc|

            if cc.product.ranking = nil?
              cc.product.ranking = 0
              cc.product.update(ranking: cc.product.ranking += cc.quantity)
            else
              cc.product.update(ranking: cc.product.ranking += cc.quantity)
            end

            if  cc.product.stock - cc.quantity <= -1
              return redirect_to cart_path(@cart),flash: {notice: '大変申し訳ございません。売り切れの商品がございます。'}
            else
              cc.product.update(stock: cc.product.stock - cc.quantity)
              # @user.cart.cd_carts.delete_all
            end
          end

      #1 ===============

  		redirect_to user_path(current_user.id)

          @cart = Cart.new
          @cart.user_id = current_user.id
          @cart.order_id = @order.cart_id
          @cart.save

    else
  		redirect_to new_order_path
  	end
  end

  def index

    @orders = Order.all.page(params[:page]).per(10).order(id: "DESC")
  end

  def update
      @order = Order.find(params[:id])
      @order.update(order_params)
       redirect_to orders_path
  end

  private
    def order_params
      params.require(:order).permit(:user_id, :cart_id, :status, :pay, :total_price, :address)
    end
    # def standby_params
    #   params.require(:standby).permit(:user_id, :cart_id, :status, :pay, :total_price, :address)
    # end

end

