class SearchesController < ApplicationController
  def search
  	@search = Product.ransack(params[:q])
    @results = @search.result
  end
end
