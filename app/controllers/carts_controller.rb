class CartsController < ApplicationController

  def show
    #s下の記述のfirtstをlastに変更する(数カ所ある)
    @cart = current_user.carts.first
    #@artist = Artist.find_by(params[:artist_id]).artist_name

    #以下は金額合計
    @price = current_user.carts.first
    @total_price = 0
    @price.cart_items.each do |cart_item|
      @total_price += cart_item.product.price * cart_item.quantity
    end

    #以下は在庫数

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
    @cart = current_user.carts.first
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    render :show
  end

end
