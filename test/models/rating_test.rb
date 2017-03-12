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

require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
