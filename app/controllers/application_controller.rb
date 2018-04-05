class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  http_basic_authenticate_with name: ENV.fetch('BASIC_AUTH_USERNAME'),
   password: ENV.fetch('BASIC_AUTH_PASSWORD') if Rails.env.staging?
end
