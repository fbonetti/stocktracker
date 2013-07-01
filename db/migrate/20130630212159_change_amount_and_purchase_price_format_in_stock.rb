class ChangeAmountAndPurchasePriceFormatInStock < ActiveRecord::Migration
  def change
    change_column :stocks, :amount, :integer
    change_column :stocks, :purchase_price, :decimal
    remove_column :stocks, :last
  end
end
