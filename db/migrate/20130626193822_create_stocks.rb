class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.integer :purchase_price
      t.integer :amount

      t.timestamps
    end
  end
end
