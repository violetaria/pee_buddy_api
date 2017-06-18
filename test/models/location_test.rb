# == Schema Information
#
# Table name: locations
#
#  id            :integer          not null, primary key
#  place_id      :string           not null
#  lat           :float            not null
#  lng           :float            not null
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  created_by_id :integer
#

require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
