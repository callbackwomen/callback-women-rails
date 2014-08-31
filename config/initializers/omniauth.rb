Rails.application.config.middleware.use OmniAuth::Builder do
  # To configure further, review:
  # https://github.com/arunagw/omniauth-twitter#authentication-options
  provider :twitter, ENV["API_KEY"], ENV["API_SECRET"]
end