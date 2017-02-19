class Location < ApplicationRecord
  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :lat,
                   :lng_column_name => :lng
  has_many :ratings

  validates_presence_of :place_id, :lat, :lng, :name
end
