class DestinationsController < ApplicationController
  before_action :get_destination, only: [:show, :edit, :destroy]

  def index
    @destinations = Destination.all
  end

  def new
    @destination = Destination.new
  end

  def create
    if @destination.create(destination_params)
      redirect_to @destination
    else
      render :new
    end
  end

  def update
    if get_destination.update(destination_params)
      redirect_to @destination
    else
      render :edit
    end
  end

  def destroy
    @destination = Destination.destroy(params[:id])
    redirect_to destinations_path
  end

private

  def destination_params
    params.require(:destination).permit(:name, :bio, :age)
  end

  def get_destination
    @destination = Destination.find(params[:id])
  end
end
