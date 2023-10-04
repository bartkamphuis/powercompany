require 'rails_helper'

RSpec.describe PurchaseJob, type: :job do
  let(:customer) { create(:customer) }
  let(:pack) { create(:pack) }

  describe '#perform' do
    it 'creates a purchase and updates the customer balance' do
      initial_balance = customer.balance
      expect {
        described_class.perform_now(customer, pack)
      }.to change { Purchase.count }.by(1)
                                    .and change { customer.reload.balance }.to(initial_balance - pack.price)
    end
  end
end
