class Categories::PostsController < ApplicationController
  before_action :set_team, only: %i[new create]
  before_action :set_category, only: %i[new create]

  def new
    @post = @category.posts.build
  end

  def create
    @post = @category.posts.build(post_params)
    @post.user = current_user

    if @post.save
      redirect_to post_path(@post), notice: '投稿を作成しました'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_team
    @team = current_user.teams.find(params[:team_id])
  end

  def set_category
    @category = @team.categories.find(params[:category_id])
  end
end
