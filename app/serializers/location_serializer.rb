# == Schema Information
#
# Table name: locations
#
#  id            :integer          not null, primary key
#  place_id      :string           not null
#  lat           :float            not null
#  lng           :float            not null
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  created_by_id :integer
#

class LocationSerializer < ActiveModel::Serializer
  attributes  :id,
              :place_id,
              :latlng,
              :name,
              :average_rating,
              :created_at,
              :created_by,
              :updated_at

  def latlng
    {
      lat: object.lat,
      lng: object.lng
    }
  end
end
