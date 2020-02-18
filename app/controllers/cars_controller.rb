class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_car, only: [:show, :edit, :update, :destroy]

  def index
     @cars = policy_scope(Car)
    if params[:search].nil?
       @cars
    else
      @cars = @cars.select { |car| car.pick_up_address.include?(params[:search])}
    end
  end

  def show
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

  private

  def find_car
    @car = Car.find(params[:id])
  end

  def set_cars_params
    params.require(:car).permit(:brand, :model, :pick_up_address, :price_per_day, :description)
  end

end
