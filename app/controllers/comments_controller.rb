class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  def create
    @new_comment = @post.comments.build(comment_params)
    @new_comment.user = current_user
    if @new_comment.save
      redirect_to @post, notice: 'Комментарий успешно создан.'
    else
      render "posts/show"
    end
  end

  def destroy
    @comment.destroy
    redirect_to @post, notice: 'Комментарий удалён.'
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
