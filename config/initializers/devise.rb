Devise.setup do |config|
  
  config.mailer_sender = 'Alan @ Wizzkid <no-reply@wizzkid.com>'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.allow_unconfirmed_access_for = 365.days
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  require 'omniauth-google-oauth2'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE if Rails.env.development? 
  config.omniauth :google_oauth2, '554911005041-esm8iv7hkgpo2qllq5prj4hk91odq187.apps.googleusercontent.com', '5YsC1eaxOtoCa8L0hAq2VTyn', {access_type: "offline", approval_prompt: ""}

  require 'omniauth-facebook'
  config.omniauth :facebook, '426246174241695', 'd9e5559f1f41492620f72c28118add23' 


end
