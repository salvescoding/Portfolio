require 'rails_helper'

RSpec.describe Blog, type: :model do
  it 'is valid with title and description' do
    blog = create(:blog)
    expect(blog).to be_valid
  end

  it 'is not valid without title' do
    expect(subject).to_not be_valid
  end

  it 'is not valid without body' do
    subject.title = "Anything"
    expect(subject).to_not be_valid
  end

  it 'is not valid without topic.id' do
    subject.title = "Anything"
    subject.body = "Lorem ipsum"
    expect(subject).to_not be_valid
  end

end
