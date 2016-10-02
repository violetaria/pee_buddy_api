class Location < ApplicationRecord
  has_many :ratings

  validates_presence_of :place_id, :lat, :lng, :name

end
