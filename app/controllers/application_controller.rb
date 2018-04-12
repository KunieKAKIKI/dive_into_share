class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  http_basic_authenticate_with name: ENV.fetch('BASIC_AUTH_USERNAME'),
   password: ENV.fetch('BASIC_AUTH_PASSWORD') if Rails.env.staging?

  helper_method :member_teams

  private
  def member_teams
    return [] unless user_signed_in?
    @_member_teams ||= current_user.teams.order(created_at: :desc)
  end
end
