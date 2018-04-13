class TeamsController < ApplicationController
  before_action :set_team, only: [:select]

  def select
    categories = @team.categories
    render json: categories.select(:id, :name)
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
