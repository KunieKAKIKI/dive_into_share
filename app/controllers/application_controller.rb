class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  http_basic_authenticate_with name: ENV.fetch('BASIC_AUTH_USERNAME'),
   password: ENV.fetch('BASIC_AUTH_PASSWORD') if Rails.env.staging?

   before_action :side_menu

   private
   def side_menu
     return unless user_signed_in?
     @teams = Team.joins(:users).where(users: { id: current_user.id })
     .includes(categories: :posts)
   end
end
