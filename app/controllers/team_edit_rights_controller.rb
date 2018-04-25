class TeamEditRightsController < ApplicationController
  before_action :set_user, only: %i[create destroy]
  before_action :set_team, only: %i[create destroy]

  def create
    authorize! @team
    TeamEditRight.create!(team: @team, user: @user)
    redirect_to team_path(@team), notice: 'チーム編集権限を設定しました'
  end

  def destroy
    authorize! @team
    team_edit_right = TeamEditRight.find(params[:id])
    team_edit_right.destroy!
    redirect_to team_path(@team), notice: 'チーム編集権限を削除しました'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end
