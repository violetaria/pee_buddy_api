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

class RatingSerializer < ActiveModel::Serializer
  attributes  :id,
              :rating,
              :rating_type,
              :location_id,
              :created_at,
              :updated_at

end
