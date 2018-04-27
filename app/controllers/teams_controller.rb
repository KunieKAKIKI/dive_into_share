class TeamsController < ApplicationController
  before_action :set_team, only: %i[edit show destroy update index]

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.author = current_user
    @team.users << current_user
      if @team.save
        redirect_to @team, notice: 'チームを作るのに成功しました'
      else
        render :new, danger: 'チームを作るのに失敗しました'
      end
  end

  def show
  end

  def edit
  end

  def destroy
    @team.destroy
    redirect_to root_path
  end

  def update
    if @team.update(team_params)
      redirect_to @team, notice: '情報を更新しました'
    else
      render :edit
    end
  end

  def select
    team = current_user.teams.find(params[:id])
    categories = team.categories
    render json: categories.select(:id, :name)
  end

  private

  def team_params
    params.require(:team).permit(:name, :description, :image)
  end

  def set_team
    @team = Team.find(params[:id])
  end
end