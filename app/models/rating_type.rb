# == Schema Information
#
# Table name: rating_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RatingType < ApplicationRecord
  validates_presence_of  :name
end
