require 'rails_helper'

RSpec.describe Pack, type: :model do
  it 'is valid with a name and price and energy units' do
    power_pack = PowerPack.new(name: 'Sample Power Pack', energy_units: 6_664_523, price: Money.new(8888, 'NZD'))
    data_pack = DataPack.new(name: 'Sample Data Pack', energy_units: 6_664_523, price: Money.new(8888, 'NZD'))
    expect(power_pack).to be_valid
    expect(data_pack).to be_valid
  end

  it 'is invalid without a name' do
    power_pack = PowerPack.new(name: nil, energy_units: 6_664_523, price: Money.new(9999, 'NZD'))
    data_pack = DataPack.new(name: nil, energy_units: 6_664_523, price: Money.new(9999, 'NZD'))
    expect(power_pack).to_not be_valid
    expect(data_pack).to_not be_valid
  end

  it 'is invalid without a price' do
    power_pack = PowerPack.new(name: 'Sample Power Pack', energy_units: 6_664_523, price: nil)
    data_pack = DataPack.new(name: 'Sample Data Pack', energy_units: 6_664_523, price: nil)
    expect(power_pack).to_not be_valid
    expect(data_pack).to_not be_valid
  end

  it 'is invalid without an energy units' do
    power_pack = PowerPack.new(name: 'Sample Power Pack', energy_units: nil, price: Money.new(9999, 'NZD'))
    data_pack = DataPack.new(name: 'Sample Data Pack', energy_units: nil, price: Money.new(9999, 'NZD'))
    expect(power_pack).to_not be_valid
    expect(data_pack).to_not be_valid
  end
end
