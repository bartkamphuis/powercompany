require 'rails_helper'

RSpec.describe PurchaseService do
  let(:customer) { create(:customer, balance: Money.new(10_000, 'NZD')) } # 100.00 NZD
  let(:pack_price) { Money.new(5000, 'NZD') } # 50.00 NZD
  let(:pack) { create(:pack, price: pack_price) }
  let(:service) { described_class.new(customer, pack) }

  describe '#call' do
    context 'when the customer has sufficient balance' do
      it 'creates a purchase' do
        expect { service.call }.to change(Purchase, :count).by(1)
      end

      it 'deducts the pack price from the customer balance' do
        expect { service.call }.to change {  customer.reload.balance }.from(Money.new(10_000, 'NZD')).to(Money.new(10_000, 'NZD') - pack_price)
      end

      it 'returns true' do
        expect(service.call).to eq(true)
      end
    end

    context 'when the customer has insufficient balance' do
      before do
        customer.update!(balance: Money.new(2000, 'NZD')) # 20.00 NZD
      end

      it 'does not create a purchase' do
        expect { service.call }.not_to change(Purchase, :count)
      end

      it 'does not change the customer balance' do
        expect { service.call }.not_to(change { customer.reload.balance })
      end

      it 'returns false' do
        expect(service.call).to eq(false)
      end
    end
  end
end