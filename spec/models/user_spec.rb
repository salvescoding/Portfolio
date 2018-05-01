require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Create a user with valid data' do
    user = User.create(email: "bla@bla", password: "oooooo", name: "Sergio")
    expect(user.name).to eq("Sergio")
    expect(user).to be_valid
  end

  it 'Unable to create a user with invalid data' do
    user = User.create(email: "bla", password: "oooo")
    expect(user).to_not be_valid
  end

end
