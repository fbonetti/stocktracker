class AddLastToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :last, :decimal
  end
end
