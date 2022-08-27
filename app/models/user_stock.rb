class UserStock < ApplicationRecord
    belongs_to :user
    belongs_to :stock
    
    def update_balance 

    end 
end
