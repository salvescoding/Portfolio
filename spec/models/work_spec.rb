require 'rails_helper'

RSpec.describe Work, type: :model do
  context 'Validates' do
    context 'Valid with attributes' do
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

    context 'Validates nested attributes name' do
      it 'nested attributes name cant be blank' do
        work = create(:work_rails)
        work.technologies.create!(name: "Ruby")
        expect(work.technologies.first).to be_valid
      end
    end

  end

  context 'Instance methods' do
    it '#set_defaults' do
      expect_any_instance_of(Work).to receive(:set_defaults)
      Work.new
    end
  end

  context 'Class methods' do
    it '.angular' do
      angular = create(:work_angular)
      expect(Work.angular).to include(angular)
    end

    it '.ruby_on_rails' do
      rails = create(:work_rails)
      expect(Work.ruby_on_rails_items).to include(rails)
    end
  end
end
