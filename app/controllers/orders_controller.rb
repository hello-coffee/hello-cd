class OrdersController < ApplicationController

  def new
  	@address = Addresses.find(params[:id])
  	@orders = Order.all
  	@cart = Carts.find_by(user_id: current_user.id)
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

