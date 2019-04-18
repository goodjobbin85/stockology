class FillInStocksTable < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :name, :string
    add_column :stocks, :ticker, :string
    add_column :stocks, :last_price, :decimal
  end
end
