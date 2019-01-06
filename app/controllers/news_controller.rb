class NewsController < ApplicationController

  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to products_path
    else
      @all_user = User.all.page(params[:page]).per(10)
      @all_product = Product.all.page(params[:page]).per(10)
      @news = News.new
      render "admins/show"
    end
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
