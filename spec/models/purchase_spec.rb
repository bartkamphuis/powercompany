require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it { should belong_to(:customer) }
  it { should belong_to(:pack) }

  it 'has a purchase date of today by default' do
    customer = Customer.create!(name: 'Test Customer', email: 'test@test.com', balance: Money.new(1000, 'NZD'))
    pack = Pack.create!(name: 'Sample Pack', energy_units: 6_664_523, price: Money.new(8888, 'NZD'))
    purchase = Purchase.create(customer:, pack:)
    expect(purchase.purchase_date).to eq(Date.today)
  end
end
