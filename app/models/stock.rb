class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks
    
    def self.find_stock(ticker)
        begin
             new_stock = StockQuote::Stock.quote(ticker)
             new(name: new_stock.company_name, ticker: new_stock.symbol, last_price: new_stock.latest_price)
        rescue Exception => e
            return nil
        end
       
    end
end
