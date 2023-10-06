class Purchase < ApplicationRecord
  belongs_to :customer
  belongs_to :power_pack, optional: true
  belongs_to :data_pack, optional: true
  validate :pack_presence
  before_create :set_purchase_date

  private

  def set_purchase_date
    self.purchase_date ||= Date.today
  end

  def pack_presence
    errors.add(:base, "A purchase must have either a PowerPack or a DataPack associated with it.") unless power_pack_id.present? || data_pack_id.present?
  end
end
