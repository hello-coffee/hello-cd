class AdminsController < ApplicationController

	before_action :authenticate_admin!


	def show
		@all_user = User.all.page(params[:page]).per(10)
		@all_product = Product.all.page(params[:page]).per(10)
		@news = News.new
	end

	def user_show
		@user = User.find(params[:id])
    	@orders = @user.orders.page(params[:page]).per(10).order(id: "DESC")
	end

	def edit
		@user = User.find(params[:id])
	end

	 def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_path(current_admin)
  end

private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :tel, :email)
  end


end
