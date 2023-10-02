class Pack < ApplicationRecord
  monetize :price_cents, as: "price", allow_nil: true
  validates :name, presence: true
  validates :price, presence: true
  validates :energy_units, presence: true
end