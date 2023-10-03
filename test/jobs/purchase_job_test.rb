require 'test_helper'

class PurchaseJobTest < ActiveJob::TestCase
  test 'purchase job' do
    customer = Customer.create!(balance: 100)
    pack = Pack.create!(price: 50)

    assert_difference 'Purchase.count', 1 do
      assert_difference 'customer.reload.balance', -pack.price do
        PurchaseJob.perform_now(customer, pack)
      end
    end
  end
end
