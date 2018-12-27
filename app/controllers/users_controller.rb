class UsersController < ApplicationController
 before_action :authenticate_user!

  def favorite_artists
    @user = current_user
    @favorite_artists = FavoriteArtist.where(user_id: @user.id)
    @search = Product.ransack(params[:q])
  end

  def show
    @user = User.find(params[:id])
    @orders = @user.orders.page(params[:page]).per(10).order(id: "DESC")

     if current_user.id != @user.id
          redirect_to user_path(current_user)
    end
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
          redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to products_path
  end

  private

  def artist_params
    params.require(:artist).permit(:artist_name)
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :tel, :email)
  end

end
