FactoryBot.define do
  factory :wholesale_deal do
    discount_rate { Faker::Number.between(from: 0.05, to: 0.50) } # Random discount rate between 5% to 50%
    start_date { Faker::Date.backward(days: 30) } # Random start date within the last 30 days
    end_date { Faker::Date.forward(days: 30) } # Random end date within the next 30 days
    # If WholesaleDeal belongs_to a Vendor or any other model, you might also define that association here:
    # association :vendor

    # traits for different scenarios
    trait :expired do
      start_date { Faker::Date.backward(days: 60) }
      end_date { Faker::Date.backward(days: 30) }
    end

    trait :upcoming do
      start_date { Faker::Date.forward(days: 30) }
      end_date { Faker::Date.forward(days: 60) }
    end
  end
end