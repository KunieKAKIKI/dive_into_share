class CategoriesController < ApplicationController
  def index
    team = current_user.teams.find(params[:team_id])
    render json: team.categories.select(:id, :name).order(created_at: :desc)
  end
end
