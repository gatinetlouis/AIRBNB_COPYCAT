class RentalsController < ApplicationController
  before_action :find_by_id, only: [:show, :destroy]

  def index
    @rentals = policy_scope(Rental)
  end

  def new
    @rental = Rental.new
    @car = Car.find(params[:car_id])
    authorize @rental
    authorize @car
  end

  def create
    @rental = Rental.new(set_rental_params)
    @rental.car = Car.find(params[:car_id])
    @rental.user = current_user
    authorize @rental
    if @rental.save
      redirect_to rentals_path
    else
      render :new
    end
  end

  def destroy
    # profil of renters and offers
    authorize @rental
    @rental.destroy
    redirect_to cars_path
  end

  def current_car_rentals
    @car = Car.find(params[:car_id])
    @rentals = @car.rentals
    # @rentals = policy_scope(Rental).where(car: @car)
    # authorize @rentals
    authorize @car

    # @rentals.each do |rental|
    #   authorize rental
    # end
    # @rentals = policy_scope(Rental)

  end

  private

  def find_by_id
    @rental = Rental.find(params[:id])
  end

  def set_rental_params
    params.require(:rental).permit(:car, :user, :start_date, :end_date)
  end

end
