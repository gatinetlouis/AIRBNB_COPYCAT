class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @rental = Rental.find(params[:id])
    # Si c'est un rental de ma voiture le review type c'est feedback_from_owner
    # else le review type c'est feedback_from_owner
    @review.review_type = ""
  end

  def create

  end

  def destroy

  end
end
