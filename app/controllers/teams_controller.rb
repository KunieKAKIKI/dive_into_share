class TeamsController < ApplicationController
  def select
    team = current_user.teams.find(params[:id])
    categories = team.categories
    render json: categories.select(:id, :name)
  end
end
