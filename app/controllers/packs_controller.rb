class PacksController < ApplicationController
  def new
    @pack = Pack.new
    @customers = Customer.all
  end

  def create
    @pack = Pack.new(pack_params)
    customer = Customer.find(params[:customer_id])
    purchase_service = PurchaseService.new(customer, @pack)

    if purchase_service.call
      redirect_to customer_path(customer), notice: 'Pack was successfully added.'
    else
      render :new
    end
  end

  private

  def pack_params
    params.require(:pack).permit(:name, :price_cents, :energy_units)
  end
end
