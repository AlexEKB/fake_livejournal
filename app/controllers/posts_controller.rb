class PostsController < ApplicationController
  expose :post
  expose :posts, -> { get_posts }

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
    Post.limit(9).order(published_at: :desc)
  end

  def find_by_slug
    Post.friendly.find_by_slug(params[:id])
  end

  def search_posts
    Post.search(params[:query]).records.published #((params[:query].present? ? params[:query] : '*')).records
  end

  def get_posts
    unless params[:query].present?
      fetch_posts
    else
      unless search_posts.present?
        flash.now[:notice] = 'Записи не найдены'
        fetch_posts
      else
        search_posts
      end
    end
  end
end
