class CartsController < ApplicationController
  def show
  	@cart = Carts.find_by(user_id: current_user.id)
  	if
  		@    .save
  		redirect_to new_oder_path
  	else
  		render :show
  	end
  end
end
