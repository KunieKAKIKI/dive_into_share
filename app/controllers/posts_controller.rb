class PostsController < ApplicationController
  before_action :set_team, only: %i[new create]
  before_action :set_category, only: %i[new create]

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to post_path(@post), notice: '投稿を作成しました'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end

  def set_team
    @team = current_user.teams.find(params[:team_id])
  end

  def set_category
    @category = @team.categories.find(params[:category_id])
  end
end
