class LocationsController < ApplicationController

  def index
    @locations = Location.includes(:ratings).within(5, origin: [params[:lat],params[:lng]])
    render json: @locations, status: :ok
  end

  def show
    @location = Location.find(params[:id])
    render json: @location, status: :ok
  end
end
