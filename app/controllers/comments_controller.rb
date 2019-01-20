class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @new_comment = @post.comments.build(comment_params)
    @new_comment.user = current_user

    respond_to do |format|
      if @new_comment.save
        format.html {redirect_to @post, notice: 'Комментарий успешно создан.'}
      else
        format.html {render "posts/show"}
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to @post, notice: 'Комментарий удалён.'}
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
