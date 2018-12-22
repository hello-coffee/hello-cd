class ReviewsController < ApplicationController
  
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  
  def index
     @reviews = Review.all
  end
  
  def show
    
  end
  
  
  def new
    @review = Review.new
  end
  

  def create
    @review = Review.new(review_params)
    if @new_review.save
      redirect_to 'Products_show_path'
    else
      redirect_to :@new
    end
  end
  
  def update
    if @review.update(review_params)
      redirect_to @review
    else
      redirect_to :@new
   end
  end

  def destroy
   if @review.destroy
       redirect_to root_path
   else
       redirect_to root_path
    end
  end


  
private
  
  def find_review
      @review = Review.find(parans[:id])
  end
  
  def review_params
  end
  
end
