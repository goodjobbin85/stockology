class AddValuesToStock < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :stock_symbol, :string
    add_column :stocks, :primary_exchange, :string
    add_column :stocks, :sector, :string
    add_column :stocks, :high, :decimal
    add_column :stocks, :low, :decimal
    add_column :stocks, :change, :decimal
    add_column :stocks, :latest_colume, :decimal
    add_column :stocks, :avg_total_volume, :decimal
    add_column :stocks, :market_cap, :decimal
    add_column :stocks, :pe_ratio, :decimal
    add_column :stocks, :fifty_two_week_high, :decimal
    add_column :stocks, :fifty_two_week_low, :decimal
    add_column :stocks, :ytd_change, :decimal
  end
end
