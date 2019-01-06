class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user

  def show
    @cart_a = Cart.find(params[:id])
    #下の記述のfirtstをlastに変更する(数カ所ある)
    @cart = current_user.carts.last
            if @cart_a.id != @cart.id
              redirect_to cart_path(current_user.carts.last)
            end

    #@artist = Artist.find_by(params[:artist_id]).artist_name
    #if @cart.cart_items != nil
    #if @cart.cart_items.product.id != nil
        #以下は金額合計
        @price = current_user.carts.last
        @total_price = 0
        @price.cart_items.each do |cart_item|
          @total_price += cart_item.product.price * cart_item.quantity
    #else
    #end

    @products = Product.all
    @cart = Cart.find(params[:id])
    @cart_items = CartItem.all
    
    end

    #以下は在庫数(商品詳細ページで対応することになった)

    #@stock = current_user.carts.first.cart_items.product.id
    #@cart_item.new
    #@stock_array = []
    #@stocks.stock.times do |quantity|
      #if quantity < 10
        #@stock_array << [quantity + 1, quantity + 1]
        #else
        #break
      #end
    #end
  end

  def destroy
    # @cart = Cart.find(params[:id])
    # @cart_item = @cart.cart_items
    #@cart_item = current_user.carts.first.cart_item.id
    #@cart_item = CartItem.find(params[:id])
    cart_item = CartItem.find(params[:cart_item_id])
    cart = cart_item.cart
    cart_item.destroy
    # render :show
    redirect_to cart_path(cart)
  end
  
  def correct_user
    @cart = current_user.carts.find_by(id: params[:id])
    unless @cart
    redirect_to products_path
  end
end

end

