class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.date :purchase_date
      t.references :customer, null: false, foreign_key: true
      t.references :pack, null: false, foreign_key: true

      t.timestamps
    end
  end
end
