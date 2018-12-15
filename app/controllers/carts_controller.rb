class CartsController < ApplicationController
  def show
  	user_id = User.find(params[:id])
  	@cart = Carts.find_by(user_id: current_user.id)
  end
end
