class PostsController < ApplicationController
  before_action :set_team, only: %i[new create edit update destroy]
  before_action :set_category, only: %i[new create edit update destroy]
  before_action :set_post, only: %i[edit update destroy]

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

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '投稿を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to root_path, notice: '投稿を削除しました。'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def set_team
    @team = current_user.teams.find(params[:team_id])
  end

  def set_category
    @category = @team.categories.find(params[:category_id])
  end
end
