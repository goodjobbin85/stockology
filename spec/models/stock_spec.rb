require 'rails_helper' 

describe Stock do 

    before do 
        user = User.create(name: "Tom", username: "Tommyd", email: "tdizzle@gmail.com")
    end 

    it "is valid without name" do 
        stock = Stock.new 
        expect(stock).to be_valid
    end  

    it "is valid with a user" do 
        stock = Stock.new(user_id: user.id) 
        stock.save
        expect(stock).to be_valid
    end 

    it "is invalid without a user" do 
        stock = Stock.new 
        stock.save
        expect(stock).not_to be_valid
    end 
end 