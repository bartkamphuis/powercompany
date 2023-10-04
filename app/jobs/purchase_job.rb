class PurchaseJob < ApplicationJob
  queue_as :default

  def perform(customer, pack)
    purchase_service = PurchaseService.new(customer, pack)
    purchase_service.call
  end
end
