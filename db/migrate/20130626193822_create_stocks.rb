class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.string :purchase_price
      t.string :amount

      t.timestamps
    end
  end
end
