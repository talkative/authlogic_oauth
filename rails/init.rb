require "authlogic_oauth"
require "oauth_callback_filter"

# Throw callback rack app into the middleware stack
if defined? Rails.configuration && defined?(Rails.configuration.middleware)
  Rails.configuration.middleware.use(OauthCallbackFilter)
elsif defined? ActionController::Dispatcher && defined?(ActionController::Dispatcher.middleware)
  ActionController::Dispatcher.middleware.use(OauthCallbackFilter)
end