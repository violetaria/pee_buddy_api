class LocationSerializer < ActiveModel::Serializer
  attributes  :id,
              :place_id,
              :latlng,
              :name,
              :created_at,
              :updated_at

  private

  def latlng
    {
      lat: object.lat,
      lng: object.lng
    }
  end
end
