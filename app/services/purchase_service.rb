class PurchaseService

  def initialize(customer, pack)
    @customer = customer
    @pack = pack
  end

  def call
    return false unless sufficient_balance?

    create_purchase
    update_customer_balance
    true
  end

  private

  def sufficient_balance?
    @customer.balance >= @pack.price
  end

  def create_purchase
    Purchase.create!(customer: @customer, pack: @pack, purchase_date: Date.today)
  end

  def update_customer_balance
    @customer.balance -= @pack.price
    @customer.save!
  end
end