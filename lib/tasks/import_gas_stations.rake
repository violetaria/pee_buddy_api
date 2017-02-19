namespace :import do
  desc 'Import Gas Stations for each state by Zip Code'
  task :gas_stations => :environment do
    state = ENV['state'].upcase
    if state.blank?
      puts 'state missing'
      puts 'Usage: import:gas_stations state=GA'
      return
    end
    CSV.foreach('lib/tasks/us_postal_codes.csv', headers: true) do |row|
      next unless row['State Abbreviation'].upcase == state
      zip_code = row['Postal Code']
      geo_coded_zip = Geokit::Geocoders::GoogleGeocoder.geocode zip_code
      results = GooglePlacesApi.nearby_search(geo_coded_zip.lat, geo_coded_zip.lng, 'gas_station')
      results.map do |result|
        Location.find_or_create_by!(place_id: result['place_id'],
        lat: result['geometry']['location']['lat'],
        lng: result['geometry']['location']['lng'],
        name: result['name'])
      end
      puts "#{zip_code} - imported #{results.size} gas stations"
    end
  end
end
