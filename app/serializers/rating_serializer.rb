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

class RatingSerializer < ActiveModel::Serializer
  attributes  :id,
              :rating,
              :rating_type,
              :created_at,
              :updated_at

end
