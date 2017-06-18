class RatingSerializer < ActiveModel::Serializer
  attributes  :id,
              :rating,
              :rating_type,
              :created_at,
              :updated_at

end
