class PostsController < ApplicationController
  def show
    @post = Post.accessible(current_user).find(params[:id])
    @comment = @post.comments.build
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    render status: :forbidden if @post.category && @post.invalid_category?

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
