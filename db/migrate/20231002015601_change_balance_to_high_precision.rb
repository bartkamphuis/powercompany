class ChangeBalanceToHighPrecision < ActiveRecord::Migration[7.0]
  def change
    change_column :customers, :balance, :decimal, precision: 20, scale: 10
  end
end
