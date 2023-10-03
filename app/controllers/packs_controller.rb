class PacksController < ApplicationController
  before_action :set_customer

  def new
    @pack = Pack.new
  end

  def create
    @pack = Pack.new(pack_params)
    purchase_service = PurchaseService.new(@customer, @pack)

    if purchase_service.call
      redirect_to customer_path(@customer), notice: 'Pack was successfully added.'
    else
      render :new
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def pack_params
    params.require(:pack).permit(:name, :price_cents, :energy_units)
  end
end
