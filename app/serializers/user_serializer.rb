# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  first_name           :string
#  last_name            :string
#  email                :string
#  uid                  :string
#  provider             :integer
#  authentication_token :string           not null
#  password_digest      :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class UserSerializer < ActiveModel::Serializer
  attributes  :id,
              :first_name,
              :last_name,
              :authentication_token,
              :email,
              :created_at,
              :updated_at
end
