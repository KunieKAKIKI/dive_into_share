class UsersController < ApplicationController
  def show
    # TODO あとでちゃんと条件のscopeなり何なりを作ること
    other_user = User.find(params[:id])
    @user = other_user if current_user.can_see?(other_user)
  end
end
