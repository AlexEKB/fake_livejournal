class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.limit(10).order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
    authorize! @post
  end

  def edit
    authorize! @post
  end

  def create
    @post = current_user.posts.create(post_params)
    respond_with @post
  end

  def update
    authorize! @post
    @post.update(post_params)
    respond_with @post
  end

  def destroy
    authorize! @post
    @post.destroy
    respond_with @post
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
