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
    # type = 'gas_station'
    # results = GooglePlacesApi.nearby_search(params[:lat],params[:lng],type)
    # binding.pry
    # results.map do |result|
    #   Location.find_or_create_by!(place_id: result['place_id'],
    #                               lat: result['geometry']['location']['lat'],
    #                               lng: result['geometry']['location']['lng'],
    #                               name: result['name'])
    # end
    @locations = Location.includes(:ratings)
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
    params.require(:locations).permit(:place_id, :lat, :lng, :name)
  end
end
