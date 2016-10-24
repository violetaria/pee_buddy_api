json.nearby_places do json.array! @places.each do |place|
  json.place_id place[:place_id]
  json.name place[:name]
end
end
