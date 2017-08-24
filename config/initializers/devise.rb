Devise.setup do |config|

  config.mailer_sender = 'Kenzo @ Satoshi Hayek <no-reply@satoshihayek.com>'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  require 'omniauth-google-oauth2'
  config.omniauth :google_oauth2, ENV['GOOGLE_APP_ID'], ENV['GOOGLE_APP_KEY'], {access_type: "offline", approval_prompt: ""}


  require 'omniauth-facebook'
  config.omniauth :facebook, 'YOUR_FACEBOOK_APP_ID', 'YOUR_FACEBOOK_APP_SECRET'

  require 'omniauth-github'
  config.omniauth :github, 'YOUR_GITHUB_APP_ID', 'YOUR_GITHUB_APP_SECRET', scope: "user:email"
end
