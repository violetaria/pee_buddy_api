class LocationsController < ApplicationController
  include RequiredParams
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
    missing_params = ensure_required_params([:ne_lat, :ne_lng, :sw_lat, :sw_ln])
    if missing_params.any?
      render json: { errors: "#{missing_params.join(', ')} must be provided." }, status: :unprocessable_entity
    else
      ne_point = Geokit::LatLng.new(params[:ne_lat],params[:ne_lng])
      sw_point = Geokit::LatLng.new(params[:sw_lat],params[:sw_lng])
      bounds = Geokit::Bounds.new(sw_point, ne_point)
      binding.pry
      @locations = Location.includes(:ratings).in_bounds(bounds)
      render json: @locations, status: :ok
    end
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
