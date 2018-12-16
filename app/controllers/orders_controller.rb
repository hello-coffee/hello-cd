class OrdersController < ApplicationController
  def new
  	@adderess = Addresses.find(params[:id])
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
  end
end

