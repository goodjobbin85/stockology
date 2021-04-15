class UserSignupMailer < ApplicationMailer
    default :from => 'noreply@stockologie.com' 

    def send_signup_email(user) 
        @user = user 
        mail( 
            :to => @user.email, 
            :subject => 'Welcome to Stockology!'
        )
    end 
end
