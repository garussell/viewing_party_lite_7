require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it { should have_many(:viewing_parties) }
  end
end