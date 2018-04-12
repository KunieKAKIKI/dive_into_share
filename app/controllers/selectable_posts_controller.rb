class SelectablePostsController < ApplicationController
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
end
