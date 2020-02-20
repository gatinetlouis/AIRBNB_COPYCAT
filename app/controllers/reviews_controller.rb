class ReviewsController < ApplicationController
  before_action :find_rental, only: [:new, :create]

  def new
    @review = Review.new
    authorize @review
    # Si c'est un rental de ma voiture le review type c'est feedback_from_owner
    # else le review type c'est feedback_from_owner
    # @review.review_type = ""
  end

  def create
    @review = Review.new(set_review_params)
    authorize @review
    @review.rental = @rental

    if @rental.car.user == current_user
      @review.review_type = "feedback_from_owner"
    else
      @review.review_type = "feedback_from_renter"
    end

    if @review.save
      redirect_to car_path(@review.car)
      # create one page of confirmation and thank for the review
    else
      render :new
    end
  end

  private

  def find_rental
    @rental = Rental.find(params[:rental_id])
  end

  def set_review_params
    params.require(:review).permit(:title, :message, :rating)
  end
end
