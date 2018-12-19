class CartsController < ApplicationController

  def show

    @cart = current_user.carts.last
    @artist = Artist.find_by(params[:artist_id]).artist_name
    puts @cart


    @stock = Product.find(params[:id])
    @current_stock_array = []
    #@stocks.current_stock.times do |quantity|
      #if quantity < 10
        #@current_stock_array << [quantity + 1, quantity + 1]
        #else
        #break
      #end
    #end
  end

end