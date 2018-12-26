class ReviewsController < ApplicationController


  def index
     @reviews = Review.all
     @products = Product.all
  end

  def show
  end

  def new
    @review = Review.new
    @product = Product.find(params[:product_id])
  end

  def create
    review = Review.new(review_params)
    review.product_id = params[:product_id]
    review.user_id = current_user.id
      if
        review.save
        redirect_to product_path(review.product.id)
      else
        redirect_to new_product_reviews_path(review.product_id)
      end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path
  end



private

      def review_params
          params.require(:review).permit(:subject, :review, :user_id, :product_id)
      end

end
