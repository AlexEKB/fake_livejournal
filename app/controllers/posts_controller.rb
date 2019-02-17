class PostsController < ApplicationController
  expose :posts, -> { Post.limit(10).order(created_at: :desc) }
  expose :post
  expose(:user_post) { current_user.posts.create(post_params) }

  def index
    posts
  end

  def show
  end

  def new
    post = Post.new
    authorize! post
  end

  def edit
    authorize! post
  end

  def create
    post = user_post
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
    params.require(:post).permit(:title, :text)
  end
end
