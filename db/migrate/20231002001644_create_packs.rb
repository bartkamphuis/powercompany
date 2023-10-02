class CreatePacks < ActiveRecord::Migration[7.0]
  def change
    create_table :packs do |t|
      t.string :name
      t.monetize :price
      t.decimal :energy_units

      t.timestamps
    end
  end
end
