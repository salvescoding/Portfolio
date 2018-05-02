FactoryBot.define do
  factory :blog do
    title Faker::Pokemon.name
    body Faker::HowIMetYourMother.quote
    topic
  end
end
