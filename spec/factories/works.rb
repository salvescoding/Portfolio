FactoryBot.define do
  factory :work do
    title Faker::Pokemon.name
    subtitle Faker::Pokemon.name
    body Faker::HowIMetYourMother.quote
  end
end
