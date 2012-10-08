class CarsController < ApplicationController
  search_action_for :cars, :title => 'Your cars', :search_column => 'serial',:dsplay_as => :model_name
  def index
    @cars = Car.all
  end
  def new
    @car = Car.new
  end
  def show
    @car = Car.find(params[:id])
  end
end
