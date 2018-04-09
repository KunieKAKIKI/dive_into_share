class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only:[:show]

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to post_path(@post), notice: '投稿しました'
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:category_id, :title, :description)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
