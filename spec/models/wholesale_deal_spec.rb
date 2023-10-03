require 'rails_helper'

RSpec.describe WholesaleDeal, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:discount_rate) }
    it { should validate_numericality_of(:discount_rate).is_greater_than_or_equal_to(0) }

    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
  end

  describe 'associations' do
    # Assuming a WholesaleDeal has many Packs and belongs to a Vendor
    # it { should have_many(:packs) }
    # it { should belong_to(:vendor) }
  end

  describe 'instance methods' do
    describe '#active?' do
      it "returns true if today's date is within the deal period" do
        deal = create(:wholesale_deal, start_date: Date.yesterday, end_date: Date.tomorrow)
        expect(deal.active?).to be true
      end

      it "returns false if today's date is outside the deal period" do
        deal = create(:wholesale_deal, start_date: 2.days.ago, end_date: Date.yesterday)
        expect(deal.active?).to be false
      end
    end
  end

  describe 'class methods' do
    describe '.current_deals' do
      it 'returns deals that are currently active' do
        active_deal = create(:wholesale_deal, start_date: Date.yesterday, end_date: Date.tomorrow)
        expired_deal = create(:wholesale_deal, start_date: 2.days.ago, end_date: Date.yesterday)
        expect(WholesaleDeal.current_deals).to include(active_deal)
        expect(WholesaleDeal.current_deals).not_to include(expired_deal)
      end
    end
  end
end
