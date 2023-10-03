require 'rails_helper'


RSpec.describe Customer, type: :model do

  Money.locale_backend = :i18n
  Money.rounding_mode = BigDecimal::ROUND_HALF_UP

  it 'is valid with a name and email' do
    customer = Customer.new(name: 'Test Customer', email: 'test@test.com', balance: Money.new(1000, 'NZD'))
    expect(customer).to be_valid
  end

  it 'is invalid without a name or email' do
    customer = Customer.new(name: nil, balance: Money.new(1000, 'NZD'))
    expect(customer).to_not be_valid
  end

  describe '#total_spent' do
    it 'calculates the total amount spent by the customer' do
      customer = create(:customer)
      pack = create(:pack, price: Money.new(5000, 'NZD'))  # Ensures the price is 50.00 NZD
      3.times { create(:purchase, customer: customer, pack: pack) }

      expect(customer.total_spent).to eq(3 * pack.price_cents)  # Expects the total spent to be 150.00 NZD
    end
  end


end

