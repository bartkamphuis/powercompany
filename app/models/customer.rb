class Customer < ApplicationRecord
  has_many :purchases
  monetize :balance_subunits, as: "balance"
end
