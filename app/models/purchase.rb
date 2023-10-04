class Purchase < ApplicationRecord
  belongs_to :customer
  belongs_to :power_pack, optional: true
  belongs_to :data_pack, optional: true
  before_create :set_purchase_date

  private

  def set_purchase_date
    self.purchase_date ||= Date.today
  end
end
