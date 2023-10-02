class ChangePriceToHighPrecision < ActiveRecord::Migration[7.0]
  def change
    change_column :packs, :price, :decimal, precision: 20, scale: 10
  end
end
