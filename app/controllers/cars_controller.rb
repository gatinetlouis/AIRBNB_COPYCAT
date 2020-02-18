class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(set_car_params)
    @car.user = current_user
    if @car.save!
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])

  end

  def update
    @car = Car.find(params[:id])
    if @car.update(set_car_params)
      redirect_to cars_path
    else
      render :edit
    end

  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end

  def current_user_cars
    @cars = Car.all.select { |car| car.user_id == current_user.id }
  end

  private

  def set_car_params
    params.require(:car).permit(:brand, :model, :pick_up_address, :price_per_day, :description)
  end

end
