class Rating < ApplicationRecord
  belongs_to :rating_type
  belongs_to :location

  validates_presence_of  :rating, :rating_type, :location
end
