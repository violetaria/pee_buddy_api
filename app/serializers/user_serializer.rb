class UserSerializer < ActiveModel::Serializer
  attributes  :id,
              :first_name,
              :last_name,
              :authentication_token,
              :email,
              :created_at,
              :updated_at
end
