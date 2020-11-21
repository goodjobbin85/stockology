class AddQuantityToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :quantity, :integer
  end
end
