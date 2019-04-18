class AddReferencesToUserStocks < ActiveRecord::Migration[5.1]
  def change
      add_reference :user_stocks, :user, index: true, foreign_key: true
      add_reference :user_stocks,  :stock, index: true, foreign_key: true
  end
end
