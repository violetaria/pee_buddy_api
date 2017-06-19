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

require 'rails_helper'

RSpec.describe Location, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
