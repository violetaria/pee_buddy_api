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

require 'rails_helper'

RSpec.describe Rating, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
