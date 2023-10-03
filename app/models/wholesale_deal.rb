class WholesaleDeal < ApplicationRecord
  # validates :discount_rate, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :discount_rate, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :start_date, :end_date, presence: true


  scope :current_deals, -> { where('? BETWEEN start_date AND end_date', Date.current) }

  def active?
    Date.current.between?(start_date, end_date)
  end


end
