class ReviewsController < ApplicationController

  def new
    @review = Review.new
    authorize @review
    @rental = Rental.find(params[:rental_id])
    # Si c'est un rental de ma voiture le review type c'est feedback_from_owner
    # else le review type c'est feedback_from_owner
    # @review.review_type = ""
  end

  def create
    @review = Review.new(set_review_params)
    authorize @review
    @rental = Rental.find(params[:rental_id])
    @review.rental = @rental
    @review.review_type = "feedback_from_renter"
    if @review.save!
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

  private

  def set_review_params
    params.require(:review).permit(:title, :message, :rating)
  end
end
