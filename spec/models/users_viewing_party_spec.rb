# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersViewingParty, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :viewing_party }
  end
end
