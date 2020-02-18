class RentalsController < ApplicationController
  before_action :find_by_id, only: [:show, :destroy]

  def index
    @rentals = Rental.all
    # profil of renters and offers
  end

  def new
    @rental = Rental.new
    @car = Car.find(params[:car_id])
  end

  def create
    @rental = Rental.new(set_rental_params)
    @rental.car = Car.find(params[:car_id])
    @rental.user = current_user
    if @rental.save
      redirect_to car_path(@rental.car)
    else
      render :new
    end
  end

  def destroy
    # profil of renters and offers
    @rental.destroy
    redirect_to cars_path
  end

  def current_car_rentals
    @car = Car.find(params[:car_id])
    @rentals = @car.rentals
  end

  private

  def find_by_id
    @rental = Rental.find(params[:id])
  end

  def set_rental_params
    params.require(:rental).permit(:car, :user, :start_date, :end_date)
  end

end
