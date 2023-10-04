require 'rails_helper'

RSpec.describe PurchaseService do
  let(:customer) { create(:customer) }
  let(:pack) { create(:pack) }
  let(:service) { described_class.new(customer, pack) }

  describe '#call' do
    context 'when there is a sufficient balance' do
      it 'schedules a PurchaseJob' do
        expect {
          service.call
        }.to have_enqueued_job(PurchaseJob).with(customer, pack)
      end
    end

    context 'when there is not a sufficient balance' do
      before do
        customer.update!(balance: Money.new(0))  # Assuming balance is a Money object
      end

      it 'does not schedule a PurchaseJob' do
        expect {
          service.call
        }.not_to have_enqueued_job(PurchaseJob)
      end
    end
  end
end