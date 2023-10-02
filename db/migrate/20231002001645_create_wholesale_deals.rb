class CreateWholesaleDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :wholesale_deals do |t|
      t.decimal :discount_rate
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
