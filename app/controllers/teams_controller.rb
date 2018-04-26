class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy]

  def new
    @team = current_user.teams.build
  end

  def create
    @team = current_user.teams.build(team_params)
    if @team.save
      redirect_to team_path(@team), notice: 'チームを作るのに成功しました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @team.update(team_params)
      redirect_to team_path(@team), notice: '情報を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to root_path, alert: 'チームを削除しました'
  end

  private

  def team_params
    params.require(:team).permit(:name, :description, :image)
  end

  def set_team
    @team = current_user.teams.find(params[:id])
  end
end
