class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :side_menu

  http_basic_authenticate_with name: ENV.fetch('BASIC_AUTH_USERNAME'),
   password: ENV.fetch('BASIC_AUTH_PASSWORD') if Rails.env.staging?

   private
   def side_menu
     return unless user_signed_in?
     @teams = Team.has_user_id(current_user.id).includes(categories: :posts)
   end
end
