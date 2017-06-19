# == Schema Information
#
# Table name: ratings
#
#  id          :integer          not null, primary key
#  rating      :float            not null
#  location_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#  rating_type :integer
#

class Rating < ApplicationRecord
  belongs_to :location
  belongs_to :user

  validates_presence_of :rating, :rating_type, :location_id, :user_id
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  enum rating_type: {
    cleanliness: 1
  }
end
