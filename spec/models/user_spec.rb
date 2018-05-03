require 'rails_helper'

RSpec.describe User, type: :model do
 context "Valid Factory" do
    it "Has a valid factory" do
      expect(build(:user)).to be_valid
    end
  end

  context "Validations" do
    before { create(:user) }

    context "Presence" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :email }
    end
  end

  context 'Instance methods' do
    let(:user) { FactoryBot.create :user }
    it '#firt_name' do
      expect(user.first_name).to eq(user.name.split.first)
    end

    it '#last_name' do
      expect(user.last_name).to eq(user.name.split.last)
    end
  end

end
