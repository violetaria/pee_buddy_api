class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, except: :create

  def create
    @location = Location.new(location_create_params)
    if @location.save
      render json: @location, status: :created
    else
      render json: { errors: @location.errors.messages }, status: :unprocessable_entity
    end
  end

  def index
    @locations = Location.includes(:ratings).within(5, origin: [params[:lat], params[:lng]])
    render json: @locations, status: :ok
  end

  def show
    @location = Location.find(params[:id])
    render json: @location, status: :ok
  end

  private

  def location_create_params
    params.require(:location)
          .permit(:place_id, :lat, :lng, :name)
          .merge(created_by: current_user)
  end
end
