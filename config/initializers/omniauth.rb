OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '372706616947-m4vmgflu55sir15j8vm364331lnkn5a3.apps.googleusercontent.com', 'mQD0FME-1OpgMfnJGOEMl0xp', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end