class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  http_basic_authenticate_with name: ENV.fetch('BASIC_AUTH_USERNAME'),
   password: ENV.fetch('BASIC_AUTH_PASSWORD') if Rails.env.staging?

   before_action :side_menu

   private
   def side_menu
     @teams = Team.all.includes(categories: :posts)
   end
end
