class Customer < ApplicationRecord
  has_many :power_packs, through: :purchases
  has_many :data_packs, through: :purchases
  monetize :balance_cents, as: "balance", allow_nil: true
  validates :name, presence: true
  validates :email, presence: true
  validates :balance, presence: true

  def total_spent
    purchases.sum { |purchase| purchase.pack.price.cents }
  end
end
