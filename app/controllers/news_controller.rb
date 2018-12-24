class NewsController < ApplicationController
  
  def create
    news = News.new(news_params)
    news.save
    redirect_to products_path
  end

  def destroy
    news = News.find(params[:id])
    news.destroy
    redirect_to products_path
  end
  
  
  private
  
  def news_params
    params.require(:news).permit(:body)
  end 
end
