require 'rails_helper' 

describe Stock do 
    user = User.create()
    before do 

    end 
    it "is valid without name" do 
        stock = Stock.new 
        expect(stock).to be_valid
    end  

    it "is valid with a user" do 

    end 

    it "is invalid without a user" do 

    end 
end 