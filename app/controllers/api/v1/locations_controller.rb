class Api::V1::LocationsController < ApplicationController

  def index
    type = 'gas_station'
    results = GooglePlacesApi.nearby_search(params[:lat],params[:lng],type)
    @locations = results.map do |result|
      Location.includes(:ratings).find_or_create_by!(place_id: result['place_id'],
                                  lat: result['geometry']['location']['lat'],
                                  lng: result['geometry']['location']['lng'],
                                  name: result['name'])
    end
    render 'index.json.jbuilder', status: :ok
  end

  def show

  end
end
