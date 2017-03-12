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
#  category    :integer          default(1)
#

class Rating < ApplicationRecord
  belongs_to :rating_type
  belongs_to :location

  validates_presence_of  :rating, :rating_type, :location
end
