require 'rails_helper'

RSpec.describe Topic, type: :model do
  context 'Validates' do
    context 'Presence' do
      it { is_expected.to validate_presence_of(:title) }
    end
  end
end
