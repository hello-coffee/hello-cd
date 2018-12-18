class CartsController < ApplicationController

  def show
    @user = current_user
    @artists = Artist.all.includes(:products)

    @stock = Product.find(params[:id])
    @current_stock_array = []
    @stocks.current_stock.times do |quantity|
      if quantity < 10
        @current_stock_array << [quantity + 1, quantity + 1]
        else
        break
      end
    end
  end

end