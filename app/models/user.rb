class User < ApplicationRecord
    validates :name, :username, :email, :password, presence: true
    validates :username, uniqueness: true
    validates :password, :email, length: { minimum: 8 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, length: { maximum: 100 }, 
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
            
    def self.search_by_email(email)
         where("email LIKE ?", "%#{email}%") 
    end
    
    def self.search_by_name(name)
        where("name LIKE ?", "%#{name}%")
    end
    
    def self.search_by_username(username)
        where("username LIKE ?", "%#{username}%")
    end
        
    has_many :user_stocks
    has_many :stocks, through: :user_stocks
    
    has_secure_password
end
