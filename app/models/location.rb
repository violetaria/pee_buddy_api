# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  place_id   :string           not null
#  lat        :float            not null
#  lng        :float            not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ApplicationRecord
  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :lat,
                   :lng_column_name => :lng
  has_many :ratings

  validates_presence_of :place_id, :lat, :lng, :name

  def average_rating
    ratings.average
  end
end
