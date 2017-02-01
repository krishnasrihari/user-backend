
Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'example.com',
  user_name:            ENV['EMAIL_NAME'],
  password:             ENV['EMAIL_PASSWORD'],
  authentication:       'plain',
  enable_starttls_auto: true  }