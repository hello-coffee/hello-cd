class ReviewsController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def destroy
    @reviews = Review.order(created_at: :asc) 
    
    @reviewslist = Reviewspage(params[:pages]).per(10)
    @reviews.destroy
    redirect_to reviews_destroypath
  end
end
