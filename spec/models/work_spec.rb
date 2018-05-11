require 'rails_helper'

RSpec.describe Work, type: :model do

  context 'Validations' do
    context 'Valid with correct params' do
      let(:work) { build(:work) }
      it 'is valid with title, description and topic' do
        expect(work).to be_valid
      end

    end

    context 'Presence' do
      it { is_expected.to validate_presence_of(:title) }

      it { is_expected.to validate_presence_of(:main_image) }

      it { is_expected.to validate_presence_of(:thumb_image) }

      it { is_expected.to validate_presence_of(:body) }
    end
  end

  context 'Nested attributes' do
    context 'Accepts' do
      it { is_expected.to accept_nested_attributes_for(:technologies) }
    end


  end

  context 'Instance methods' do
    xit '#set_defaults' do
      expect_any_instance_of(Work).to receive(:set_defaults)
      Work.new
    end
  end

  context 'Class methods' do
    xit '.angular' do
      angular = create(:work_angular)
      expect(Work.angular).to include(angular)
    end

    xit '.ruby_on_rails' do
      rails = create(:work_rails)
      expect(Work.ruby_on_rails_items).to include(rails)
    end
  end
end
