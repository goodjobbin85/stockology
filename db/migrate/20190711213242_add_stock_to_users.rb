class AddStockToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :stock, foreign_key: true
  end
end
