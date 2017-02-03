
Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'morning-forest-10892.herokuapp.com',
  user_name:            ENV['EMAIL_NAME'],
  password:             ENV['EMAIL_PASSWORD'],
  authentication:       'plain',
  enable_starttls_auto: true  }