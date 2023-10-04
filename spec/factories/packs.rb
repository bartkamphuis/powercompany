# FactoryBot.define do
#   factory :packs do
#     name { 'Basic Pack' }
#     price_cents { 5000 }  # 50.00 NZD
#     energy_units { 20_000 }  # 20 kWh
#     price_currency { 'NZD' }
#   end
# end


FactoryBot.define do
  factory :pack do
    name { Faker::Commerce.product_name }
    price_cents { Faker::Number.between(from: 1000, to: 10000) }  # Price in cents
    price_currency { 'NZD' }
    energy_units { Faker::Number.decimal(l_digits: 2, r_digits: 2) * 100 }
  end
end