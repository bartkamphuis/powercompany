FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    balance_cents { Faker::Number.between(from: 1_000, to: 20_000) }  # Random balance between 10.00 to 200.00 NZD
    email { Faker::Internet.email }
  end
end