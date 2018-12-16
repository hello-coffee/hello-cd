class CartsController < ApplicationController
  def show

      @product = Products.find(params[:id])

      @current_stock_array = []
      @products.current_stock.times do |stock|
    if stock < 10
        @current_stock_array << [stock + 1, stock + 1]
    else
    break
    end

  	 @user = User.find(params[:id])
  	 @cart = Carts.find_by(user_id: current_user.id)
    if
  		@cart.save
  		redirect_to new_oder_path
    else
  		render :show
    end
  end
end
