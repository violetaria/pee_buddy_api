require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'valid fabricator' do
    subject { Fabricate.build :user }
    it { is_expected.to be_valid }
  end

end
