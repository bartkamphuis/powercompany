FactoryBot.define do
  factory :pack do
    name { 'Basic Pack' }
    price_cents { 5000 }  # 50.00 NZD
    energy_units { 20_000 }  # 20 kWh
    price_currency { 'NZD' }
  end
end