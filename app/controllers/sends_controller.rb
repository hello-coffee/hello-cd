class SendsController < ApplicationController
  def new
  	@address = Address.new
  	@addresses = current_user.addresses

  end

  def create
    @cart = current_user.carts.last
  	if params[:address][:id] != nil
  		p "aaaaa"
  		params[:address][:id]
      @address = Address.find(params[:address][:id])
      @cart.address_id = @address.id
  		@cart.save
      redirect_to new_order_path
  	else
  		@address = Address.new(address_params)
    		@address.user_id = current_user.id
    		unless @address.save
          @addresses = current_user.addresses
          render "new"
    			#redirect_to new_send_path
    		else
    			@cart.address_id = @address.id
          @cart.save
          redirect_to new_order_path
    		end
  	 end
  end

 #  	if
 #  		@address = Address.new(address_params)
 #  		@address.user_id = current_user.id
 #  		@address.save
 #  		redirect_to new_order_path
 #  	else
 #  		redirect_to new_send_path
	# end
 #  end

  private
  def address_params
  	params.require(:address).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :tel, :email, :user_id)
  end
end

