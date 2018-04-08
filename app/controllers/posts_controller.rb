class PostsController < ApplicationController
  before_action :set_post, only:[:show, :create]

  def show
  end

  def new
  end

  def create
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
end
