class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_car, only: [:show, :edit, :update, :destroy]

  def index
     @cars = policy_scope(Car)
    if params[:search].nil?
       @cars
    else
      @cars = @cars.select { |car| car.pick_up_city.downcase.include?(params[:search].downcase)}
    end
  end

  def show
    @rental = Rental.new
    @rental.car = @car
    @rental.user = current_user
    authorize @car
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create

    @car = Car.new(set_cars_params)
    authorize @car
    @car.user = current_user
    if @car.save!
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def edit
    authorize @car
  end

  def update
    authorize @car
    if @car.update(set_cars_params)
      redirect_to cars_path
    else
      render :edit
    end

  end

  def destroy
    authorize @car
    @car.destroy
    redirect_to cars_path
  end

  def current_user_cars
    @cars = policy_scope(Car).select { |car| car.user_id == current_user.id }

    # @cars = Car.select { |car| car.user_id == current_user.id }
    # @cars.each {|car| authorize car }
  end

  private

  def find_car
    @car = Car.find(params[:id])
  end

  def set_cars_params
    params.require(:car).permit(:brand, :model, :pick_up_address, :pick_up_city, :price_per_day, :description, :photo)
  end

end
