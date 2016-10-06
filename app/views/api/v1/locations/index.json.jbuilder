json.locations do json.array! @locations.each do |location|
  json.id location.id
  json.place_id location.place_id
  json.latlng do
    json.lat location.lat
    json.lng location.lng
  end
  json.name location.name
end
end
