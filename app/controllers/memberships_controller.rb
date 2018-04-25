class MembershipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @team = Team.find(params[:team_id])
    membership = @user.memberships.create(team_id: @team.id)
    redirect_to team_users_path, notice: "#{@user.name}さんを招待しました。"
  end

  def destroy
    @user = User.find(params[:user_id])
    @team = Team.find(params[:team_id])
    membership = @user.memberships.find_by(team_id: @team).destroy
    redirect_to team_users_path, notice: "#{@user.name}さんがチームから退会しました。"
  end
end
