class ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = @cocktail.reviews.build(review_params)
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

private
  def review_params
    params.require(:review).permit(:content, :rating, :cocktail_id)
  end

end
