require 'rails_helper'

RSpec.describe Pack, type: :model do
  it 'is valid with a name and price and energy units' do
    pack = Pack.new(name: 'Sample Pack', energy_units: 6_664_523, price: Money.new(8888, 'NZD'))
    expect(pack).to be_valid
  end

  it 'is invalid without a name' do
    pack = Pack.new(name: nil, energy_units: 6_664_523, price: Money.new(9999, 'NZD'))
    expect(pack).to_not be_valid
  end

  it 'is invalid without a price' do
    pack = Pack.new(name: 'Sample Pack', energy_units: 6_664_523, price: nil)
    expect(pack).to_not be_valid
  end

  it 'is invalid without an energy units' do
    pack = Pack.new(name: 'Sample Pack', energy_units: nil, price: Money.new(9999, 'NZD'))
    expect(pack).to_not be_valid
  end
end
