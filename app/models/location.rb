class Location < ApplicationRecord
  acts_as_mappable
  has_many :ratings
  has_one :my_rating, -> { where(user: current_user).first }, class_name: 'Rating'
  validates_presence_of :place_id, :lat, :lng, :name

end
