class PurchaseService
  def initialize(customer, pack)
    @customer = customer
    @pack = pack
  end

  def call
    return false unless sufficient_balance?

    PurchaseJob.perform_later(@customer, @pack)
    true
  end

  private

  def sufficient_balance?
    @customer.balance >= @pack.price
  end
end