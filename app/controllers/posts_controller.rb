class PostsController < ApplicationController
  expose :post
  expose :posts, -> {fetch_posts}

  def new
    authorize! post
  end

  def show
    find_by_slug
  end

  def edit
    authorize! post
  end

  def create
    post.save
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
    params.require(:post).permit(:title, :text, :published, :slug, :all_tags).merge(user: current_user)
  end

  def fetch_posts
    Post.limit(10).order(published_at: :desc)
  end

  def find_by_slug
    Post.friendly.find_by_slug(params[:id])
  end
end
