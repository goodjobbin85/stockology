# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize! 

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '<SENDGRID_API_KEY>',
  :domain => 'heroku.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
