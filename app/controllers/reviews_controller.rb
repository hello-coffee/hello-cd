class ReviewsController < ApplicationController
  
  def new
    @new_review = Review.new
  end

  def create
    review = Review.new(review_params)
    review.save
    redirect_to 'Product_top_path'
  end

  def index
  end

  def destroy
    @reviews = Review.order(created_at: :asc) 
    
    @reviewslist = Reviewspage(params[:pages]).per(10)
    @reviews.destroy
    redirect_to reviews_destroypath
  end
  
  
  private
  
  def post_params
      params.require(:review).permit(:subject, :review)
  end
  
end
