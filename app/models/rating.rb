class Rating < ApplicationRecord
  belongs_to :location
  belongs_to :user

  validates_presence_of  :rating, :location, :user, :category
  validates_uniqueness_of :user, scope: [:location, :category]

  enum category: [ :overall ]
end
