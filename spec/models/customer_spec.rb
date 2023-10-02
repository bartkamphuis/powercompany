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

end

