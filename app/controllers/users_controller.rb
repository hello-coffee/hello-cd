class UsersController < ApplicationController

  def favorite_artists
    @user = current_user
    @user.artists
  end

  def show
  end

  def update
  end

  def destroy
  end

  def edit
  end

  private

  def artist_params
    params.require(:artist).permit(:artist_name)
  end

end
