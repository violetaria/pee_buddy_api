class GooglePlacesApi
  include HTTParty
  base_uri "https://maps.googleapis.com/maps/api/place"
  format :json

  def self.nearby_search(lat,lng,type)
    response = GooglePlacesApi.get("/nearbysearch/json",
    query: { 'location' => "#{lat},#{lng}",
    'radius'  => '5000',
    'sensor'  => 'true',
    'types'   => "#{type}",
    'key'     => "#{ENV['GOOGLE_API_KEY']}"})
    response['results']
  end

  def self.find_close_places(lat,lng)
    response = GooglePlacesApi.get("/nearbysearch/json",
    query: { 'location' => "#{lat},#{lng}",
    'radius'  => '100',
    'sensor'  => 'true',
    'key'     => "#{ENV['GOOGLE_API_KEY']}"})
    response['results']
  end

end
