require 'rails_helper'

RSpec.describe DataPack, type: :model do
  it 'is valid with a name, price, and energy units' do
    data_pack = DataPack.new(name: 'Sample Data Pack', energy_units: 6_664_523, price: Money.new(8888, 'NZD'))
    expect(data_pack).to be_valid
  end

  it 'is invalid without a name' do
    data_pack = DataPack.new(name: nil, energy_units: 6_664_523, price: Money.new(9999, 'NZD'))
    expect(data_pack).to_not be_valid
  end

  it 'is invalid without a price' do
    data_pack = DataPack.new(name: 'Sample Data Pack', energy_units: 6_664_523, price: nil)
    expect(data_pack).to_not be_valid
  end

  it 'is invalid without energy units' do
    data_pack = DataPack.new(name: 'Sample Data Pack', energy_units: nil, price: Money.new(9999, 'NZD'))
    expect(data_pack).to_not be_valid
  end
end
