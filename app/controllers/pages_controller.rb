class PagesController < ApplicationController
  def home
    @customers = Customer.all
    @packs = Pack.all
  end

  def show_customer
    @customers = Customer.all
    @customer = Customer.find(params[:id])
    @purchased_packs = @customer.purchases.includes(:pack)
    # Rails.logger.debug @purchased_packs
    @packs = @purchased_packs.map(&:pack)  # Extract the packs from the purchases
    Rails.logger.debug @packs
    respond_to do |format|
      format.html
      format.js
    end
  end

  def about
    @customers = Customer.all
    # show content of local file README.md and render as markdown
    @markdown = File.read("README.md")
    render markdown: @markdown
  end
end
