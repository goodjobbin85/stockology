require 'rails_helper' 

describe Stock do 
    it "is valid without name" do 
        stock = Stock.new 
        expect(stock).to be_valid
    end 
end 