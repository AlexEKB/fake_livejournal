class PostsController < ApplicationController
  expose :post
  expose :posts, -> { Post.limit(10).order(created_at: :desc) }
  # expose_decorated :post

  def index
    posts
  end

  def show
    respond_with post
  end

  def new
    respond_with(post = Post.new)
    authorize! post
  end

  def edit
    authorize! post
  end

  def create
    post.save(post_params)
    respond_with post
  end

  def update
    post.update(post_params)
    respond_with post
  end

  def destroy
    post.destroy
    respond_with post
  end

  private

  def post_params
    params.require(:post).permit(:title, :text).merge(user: current_user)
  end
end
