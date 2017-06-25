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

class Location < ApplicationRecord
  acts_as_mappable default_units: :miles,
                   default_formula: :sphere,
                   distance_field_name: :distance,
                   lat_column_name: :lat,
                   lng_column_name: :lng
  has_many :ratings
  belongs_to :created_by, class_name: User, foreign_key: :created_by_id

  validates_presence_of :place_id, :lat, :lng, :name
  validates_uniqueness_of :place_id

  def average_rating
    ratings.average(:rating)
  end
end
