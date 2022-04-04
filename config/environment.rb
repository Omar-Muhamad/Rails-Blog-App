# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp 
ActionMailer::Base.perform_deliveries = true 
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com' ,
  port: 465, 
  domain: 'gmail.com', 
  user_name: 'test.raila112233@gmail.com', 
  password: 'Asd112233', 
  authentication: 'plain',
  :ssl => true, :tsl => true, enable_starttls_auto: true
}