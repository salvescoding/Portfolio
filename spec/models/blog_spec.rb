require 'rails_helper'

RSpec.describe Blog, type: :model do

  context 'Validates' do

    it 'is valid with title, description and topic' do
      blog = create(:blog)
      expect(blog).to be_valid
    end

    it { is_expected.to validate_presence_of(:title) }

    it { is_expected.to validate_presence_of(:body) }

    it 'is not valid without topic' do
      subject.title = "Anything"
      subject.body = "Lorem ipsum"
      expect(subject).to_not be_valid
    end
  end

  context 'Associations' do
    it { is_expected.to belong_to(:topic) }
  end

  context 'Enums' do
    it { is_expected.to define_enum_for(:status) }
  end
end
