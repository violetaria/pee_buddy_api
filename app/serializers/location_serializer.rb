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
              # :created_by,
              :distance,
              :updated_at,
              :rating_count,
              :my_rating

  def my_rating
    current_user.ratings.where(location: object).first if current_user.present?
  end

  def distance
    object.distance_from(@bounds.center)
  end

  def rating_count
    object.ratings.count
  end

  def latlng
    {
      lat: object.lat,
      lng: object.lng
    }
  end
end
