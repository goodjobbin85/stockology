class UserSignupMailer < ApplicationMailer
    default :from => 'me@example.com' 

    def send_signup_email(user) 
        @user = user 
        mail( 
            :to => @user.email, 
            :subject => 'Welcome to Stockology!'
        )
    end 
end
