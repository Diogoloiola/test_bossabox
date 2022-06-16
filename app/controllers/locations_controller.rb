class LocationsController < ApplicationController # rubocop:disable Style/Documentation
  before_action :set_location, only: %i[show update destroy]

  def index
    @locations = Location.all
  end

  def show; end

  def create
    @location = Location.new(location_params)

    if @location.save
      render :show, status: :created
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  def update
    if @location.update(location_params)
      render :show, status: :ok
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @location.destroy
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:title, :description, :link, tags: [])
  end
end
