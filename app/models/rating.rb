class Rating < ApplicationRecord
  belongs_to :rating_type
  belongs_to :location
end
