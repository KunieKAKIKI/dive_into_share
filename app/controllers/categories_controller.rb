class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit show destroy update]

  def new
    @team = Team.find(params[:team_id])
    @category = @team.categories.build
  end

  def create
    @team = Team.find(params[:team_id])
    @category = @team.categories.build(category_params)
      if @category.save
        redirect_to team_category_path(@category.team.id,@category)
      else
        render :new, danger: 'カテゴリを作るのに失敗しました'
      end
  end

  def show
  end

  def edit
  end

  def destroy
    @category.destroy
    redirect_to root_path
  end

  def update
    if @category.update(category_params)
      redirect_to team_category_path(@category.team, @category), notice: '情報を更新しました'
    else
      render :edit
    end
  end


  private

  def category_params
    params.require(:category).permit(:team_id, :name, :description, :image)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
