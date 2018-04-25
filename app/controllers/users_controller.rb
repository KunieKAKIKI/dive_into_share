class UsersController < ApplicationController
  def index
    @teams = Team.find(params[:team_id])
    @users = @teams.users
    @users_not_in_team = User.where.not(id: @users)
  end
  def show
    # TODO あとでちゃんと条件のscopeなり何なりを作ること
    other_user = User.find(params[:id])
    @user = other_user if current_user.can_see?(other_user)
  end
end
