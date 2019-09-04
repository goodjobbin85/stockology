class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks
    
    def self.find_stock(ticker)
        begin
             client = IEX::Api::Client.new(publishable_token: 'pk_3663767343b64e9886356a14077c3f2c')
             new_stock = client.quote(ticker)
             new(name: new_stock.company_name, ticker: new_stock.symbol, 
                 market_cap: new_stock.market_cap, last_price: new_stock.latest_price,
                 sector: new_stock.sector, high: new_stock.high, low: new_stock.low,
                 pe_ratio: new_stock.pe_ratio, ytd_change: new_stock.ytd_change)
        rescue Exception => e
             return nil
        end
       
    end
    
    def self.find_by_ticker(ticker)
        #where("ticker LIKE ?", "%#{ticker}%").first
        where(ticker: ticker).first
    end
    
    
end
