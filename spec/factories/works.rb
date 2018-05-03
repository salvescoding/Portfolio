FactoryBot.define do
  factory :work do
    title Faker::Pokemon.name
    subtitle Faker::Pokemon.name
    body Faker::HowIMetYourMother.quote

    trait :angular do
      subtitle "Angular"
    end

    trait :ruby_on_rails do
      subtitle "Ruby on Rails"
    end

    factory :work_angular, traits: [:angular]
    factory :work_rails, traits: [:ruby_on_rails]

  end
end
