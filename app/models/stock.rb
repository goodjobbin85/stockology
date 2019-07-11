class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks
    
    def self.find_stock(ticker)
        begin
             client = IEX::Api::Client.new(publishable_token: 'pk_3663767343b64e9886356a14077c3f2c')
             new_stock = client.quote(ticker)
             new(name: new_stock.company_name, ticker: new_stock.symbol, last_price: new_stock.latest_price)
        rescue Exception => e
             return nil
        end
       
    end
end
