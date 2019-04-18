class CreateUserStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_stocks do |t|
      

      t.timestamps
    end
  end
end
