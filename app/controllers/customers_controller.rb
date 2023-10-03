# app/controllers/customers_controller.rb
class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @customers = Customer.all
    @packs = Pack.all
    @purchase = Purchase.new
  end

  def add_pack
    @customer = Customer.find(params[:id])
    @purchase = @customer.purchases.new(purchase_params)
    if @purchase.save
      redirect_to customer_path(@customer), notice: 'Pack added successfully'
    else
      @packs = Pack.all
      render :show
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:pack_id)
  end
end
