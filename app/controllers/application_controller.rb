class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  if Rails.env.staging?
    http_basic_authenticate_with name: ENV.fetch('BASIC_AUTH_USERNAME'),
                                 password: ENV.fetch('BASIC_AUTH_PASSWORD')
  end

  helper_method :member_teams

  private

  def member_teams
    return [] unless user_signed_in?
    @_member_teams ||= current_user.teams.order(created_at: :desc)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name image description])
  end
end
