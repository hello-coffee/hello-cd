class ArtistsController < ApplicationController
  def show
  	@artist = Artist.find(params[:id])
  	@products = @artist.products
  end
end
