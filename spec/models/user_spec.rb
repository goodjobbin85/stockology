require 'rails_helper' 

describe User do 
    it "is not valid without name" do 
        user = User.new(name: nil) 
        expect(user).to_not be_valid
    end 

    it "is not valid without username" do 
        user = User.new(username: nil) 
        expect(user).to_not be_valid
    end 

    it "is not valid without email" do 
        user = User.new(email: nil) 
        expect(user).to_not be_valid
    end 

    it "has unique username" do 
        user1 = User.new(username: "TommyD") 
        user2 = User.new(username: "TommyD") 
        expect(user2).to_not be_valid
    end 
end 