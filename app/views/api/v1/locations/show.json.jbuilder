json.locations do
  json.id @location.id
  json.place_id @location.place_id
  json.latlng do
    json.lat @location.lat
    json.lng @location.lng
  end
  json.name @location.name
  json.overall_rating @location.ratings.average(:rating)
  json.rating_count @location.ratings.count
  #json.my_rating location.my_rating
end
