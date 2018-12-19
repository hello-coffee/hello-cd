class FavoriteArtistsController < ApplicationController
  def create
  	@user_id = current_user.id
    @artist_id = Artist.find(params[:id]).id
    @favorite_artist = FavoriteArtist.new(artist_id: @artist_id, user_id: @user_id)
    if @favorite_artist.save
      redirect_to product_path(params[:id])
    else
      redirect_to product_path(params[:id])
    end
  end

  def destroy
  	@favorite_artist = FavoriteArtist.find(params[:id])
    if @favorite_artist.destroy
       redirect_to favorite_artists_path
    end
  end

end
