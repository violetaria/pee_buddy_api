# == Schema Information
#
# Table name: ratings
#
#  id          :integer          not null, primary key
#  rating      :float            not null
#  location_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  rating_type :integer
#  user_id     :integer
#

class Rating < ApplicationRecord
  belongs_to :location
  belongs_to :user

  validates_presence_of :rating, :rating_type, :location_id, :user_id
  validates_uniqueness_of :rating, scope: [:location_id, :user_id, :rating_type], message: "Oh no! You've already let loose a fury of ratings on this toilet!"
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  enum rating_type: {
    cleanliness: 1
  }
end
