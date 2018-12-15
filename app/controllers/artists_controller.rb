class ArtistsController < ApplicationController
  def show
  	@artist = Artist.find(params[:id])
  	@products = @artist.products

  	# 検索オブジェクト
    @search = Artist.ransack(params[:q])
    # 検索結果
    @artists = @search.result
  end
end
