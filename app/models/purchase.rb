class Purchase < ApplicationRecord
  belongs_to :customer
  belongs_to :pack
  before_create :set_purchase_date

  private

  def set_purchase_date
    self.purchase_date ||= Date.today
  end
end
