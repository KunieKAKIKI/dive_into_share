class CommentsController < ApplicationController
  before_action :set_post, only: %i[create destroy]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if current_user.can_comment?(@post)
      @comment.save
    else
      render status: :forbidden
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if current_user.can_delete_comment?(@comment)
      @comment.destroy!
    else
      render status: :forbidden
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
