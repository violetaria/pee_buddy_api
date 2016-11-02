json.locations do json.array! @locations.each do |location|
  json.id location.id
  json.place_id location.place_id
  json.latlng do
    json.lat location.lat
    json.lng location.lng
  end
  json.name location.name
  json.overall_rating location.overall_rating
  json.rating_count location.rating_count
  #json.my_rating location.my_rating
end
end
