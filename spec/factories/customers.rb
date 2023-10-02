FactoryBot.define do
  factory :customer do
    name { 'John Doe' }
    balance_cents { 10_000 }  # 100.00 NZD
    email { '<EMAIL>' }
  end
end
