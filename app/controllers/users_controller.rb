class UsersController < ApplicationController

  def favorite_artists
  end

  def show
    @user = current_user
  end

  def update
  end

  def destroy
  end

  def edit
    @user = current_user
  end
end
