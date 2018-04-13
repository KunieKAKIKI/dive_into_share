class CommentsController < ApplicationController
  include AjaxHelper

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :create }
      else
        flash[:alert] = "コメントを投稿できませんでした"
        flash.keep(:alert)
        format.js { render ajax_redirect_to(short_post_path(@post)) }
      end
    end
  end

  def destroy
    @comment= Comment.find(params[:id])
    respond_to do |format|
      @post = Post.find(params[:post_id])
      if @comment.destroy
        format.js { render :destroy }
      else
        flash[:alert] = "コメントを削除できませんでした"
        flash.keep(:alert)
        format.js { render ajax_redirect_to(short_post_path(@post)) }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def short_post_path(post)
    team_category_post_path(post.category.team, post.category, post)
  end
end
