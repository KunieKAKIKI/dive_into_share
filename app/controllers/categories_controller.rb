class CategoriesController < ApplicationController
  before_action :set_team
  before_action :set_category, only: %i[show edit update destroy]

  def new
    @category = @team.categories.build
  end

  def create
    @category = @team.categories.build(category_params)
    if @category.save
      redirect_to team_category_path(@team, @category)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to team_category_path(@team, @category), notice: '情報を更新しました'
    else
      render :edit
    end
  end

  def destroy
    # TODO: 後でbankenによる権限付与を行う
    @category.destroy!
    redirect_to root_path, alert: 'カテゴリを削除しました'
  end

  private

  def category_params
    params.require(:category).permit(:name, :description, :image)
  end

  def set_team
    @team = current_user.teams.find(params[:team_id])
  end

  def set_category
    @category = @team.categories.find(params[:id])
  end
end
