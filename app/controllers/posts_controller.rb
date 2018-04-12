class PostsController < ApplicationController
  before_action :set_team
  before_action :set_category

  def show
    @post = @category.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end
  def create
    @post= Post.new
    respond_to do |format|
      if @post.save
        flash[:notice] = "投稿しました"
        format.html { redirect_to team_category_post_path(@team,@category,@post) }
      else
        flash[:danger] = "投稿を作るのに失敗しました"
        format.html { render :new}
      end
    end
  end
  private

  def set_team
    @team = current_user.teams.find(params[:team_id])
  end

  def set_category
    @category = @team.categories.find(params[:category_id])
  end
end
