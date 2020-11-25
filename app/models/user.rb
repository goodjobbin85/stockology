class User < ApplicationRecord
    attr_accessor :remember_token
    
    validates :name, :username, :email, presence: true
    validates :username, uniqueness: true
    validates :email, length: { minimum: 8 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, length: { maximum: 100 }, 
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
            
    def self.search_by_email(email)
         where("email LIKE ?", "%#{email}%") 
         begin
            user = User.find_by(email: email)
            new(name: user.name, email: user.email, username: user.username)
         rescue Exception => e
            return nil
            
         end
    end 

    def self.youbank_welcome(name) 
        user = User.find_by(name: name) 
        "#{user}! #{YouBank.welcome}"
    end 
    
    def self.search_by_name(name)
        where("name LIKE ?", "%#{name}%")
        begin
            user = User.find_by(name: name)
            new(name: user.name, email: user.email, username: user.username)
        rescue Exception => e
            return nil
        end
    
    end
    
    def self.search_by_username(username)
        where("username LIKE ?", "%#{username}%")
        begin
            user = User.find_by(username: username)
            new(name: user.name, email: user.email, username: user.username)
        rescue Exception => e
            return nil
        end
    end
    
    def stock_added?(ticker)
        stock = Stock.find_by_ticker(ticker)
        return false unless stock
        user_stocks.where(stock_id: stock.id).exists?
    end
    
    def under_stock_limit?
        (user_stocks.count < 10)
    end
    
    def can_add_stock?(ticker)
        under_stock_limit? && !stock_added?(ticker)
    end 

    def stock_purchase_price(ticker, quantity) 
        stock = Stock.find_by_ticker(ticker)
        total_price = stock.latest_price * quantity 
        total_price
    end
    
    def self.search(param)
        cleaned_param = clean_parameter(param)
        result = (match_name(param) + match_username(param) +
                 match_email(param)).uniq
        return nil unless result
        result
    end
    
    def self.match_name(name)
        where("name LIKE ?", "%#{name}%")
    end
    
    def self.match_email(email)
        where("email LIKE ?", "%#{email}%")
    end
    
    def self.match_username(username)
        where("username LIKE ?", "%#{username}%")
    end
    
    def self.clean_parameter(param)
        param.strip!
        param.downcase!
    end
    
    def not_yet_friends?(user)
        friendships.where(friend_id: user).count < 1
    end
    
    def User.digest(string)
        Digest::SHA2.hexdigest(string)
    end
    
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    
    def remember 
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        Bcrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    
    def forget
        update_attribute(:remember_digest, nil)
    end
    
    has_many :friendships
    has_many :friends, through: :friendships
    has_many :user_stocks
    has_many :stocks, through: :user_stocks
    
    has_secure_password
end
