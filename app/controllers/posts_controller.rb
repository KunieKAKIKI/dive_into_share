class PostsController < ApplicationController
  before_action :set_team
  before_action :set_category

  def show
    @post = @category.posts.find(params[:id])
  end

  private

  def set_team
    @team = current_user.teams.find(params[:team_id])
  end

  def set_category
    @category = @team.categories.find(params[:category_id])
  end
end
