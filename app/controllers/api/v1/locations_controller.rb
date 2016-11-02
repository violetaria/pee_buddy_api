class Api::V1::LocationsController < ApplicationController
  before_action :set_location, only: [:show]
  #before_action :authenticate_user!

  def create
    @location = Location.new(location_params)
    if @location.save
      render 'create.json.jbuilder', status: :created
    else
      render json: { errors: @location.errors.messages }, status: :unprocessable_entity
    end
  end

  def index
    users_location = Geokit::LatLng.new(params[:lat],params[:lng])
    @locations = Location.select('locations.*, AVG(ratings.rating) AS overall_rating, COUNT(ratings.rating) AS rating_count')
                          .within(10, :origin => users_location)
                          .left_joins(:ratings)
                          .group('locations.id')
    render 'index.json.jbuilder', status: :ok
  end

  def show
    render 'show.json.jbuilder', status: :ok
  end

  def nearby_places
    results = GooglePlacesApi.find_close_places(params[:lat],params[:lng])
    @places = results.map do |result|
      { place_id: result['place_id'],
        name: result['name'] }
    end
    render 'nearby_places.json.jbuilder', status: :ok
  end

  private
  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:place_id, :lat, :lng, :name)
  end
end
