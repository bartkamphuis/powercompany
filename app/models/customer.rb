class Customer < ApplicationRecord
  has_many :purchases
  monetize :balance_cents, as: "balance", allow_nil: true
  validates :name, presence: true
  validates :email, presence: true
  validates :balance, presence: true

  def total_spent
    purchases.sum { |purchase| purchase.pack.price.cents }
  end
end
