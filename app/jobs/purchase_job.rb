class PurchaseJob < ApplicationJob
  queue_as :default

  def perform(customer, pack)
    create_purchase(customer, pack)
    update_customer_balance(customer, pack)
  end

  private

  def create_purchase(customer, pack)
    Purchase.create!(customer: customer, pack: pack, purchase_date: Date.today)
  end

  def update_customer_balance(customer, pack)
    customer.balance -= pack.price
    customer.save!
  end
end