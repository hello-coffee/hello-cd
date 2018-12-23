class FavoriteArtistsController < ApplicationController
  # def create
    # @user_id = current_user.id
    # @product = find(params[:id])
    # @artist_id = @product.artist_id
    # @favorite_artist = FavoriteArtist.new(artist_id: @artist_id, user_id: @user_id)
    # if @favorite_artist.save
    #   redirect_to product_path(params[:id])
    # else
    #   redirect_to product_path(params[:id])
    # end
  # end


  def create
      @user_id = current_user.id
      @artist_id = Artist.find(params[:id]).id
      @favorite_artist = FavoriteArtist.new(artist_id: @artist_id, user_id: @user_id)
      if @favorite_artist.save
        redirect_to favorite_artists_path
      end
  end


  def destroy
  	@favorite_artist = FavoriteArtist.find(params[:id])
    if @favorite_artist.destroy
       redirect_to favorite_artists_path
    end
  end

private

      def artist_params
          params.require(:artist).permit(:artist_name,
           products_attributes: [:id, :artist_id, :title, :image, :price, :label, :categoty_id, :deleted_at, :stock, :_destroy,
            discs_attributes: [:id, :disc_name, :product_id, :_destroy,
             songs_attributes: [:id, :disc_id, :song_name, :song_sort, :_destroy]]])
      end

        def product_params
            params.require(:product).permit(:artist_id, :title, :image, :price, :label, :category_id, :deleted_at, :stock,
             discs_attributes: [:id, :disc_name, :product_id, :_destroy,
              songs_attributes: [:id, :disc_id, :song_name, :song_sort, :_destroy]])
        end

end
