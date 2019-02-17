class CommentsController < ApplicationController
  expose :post
  expose :new_comment
  expose :comment

  def create
    new_comment = post.comments.build(comment_params)
    authorize! new_comment
    if new_comment.save
      redirect_to post, notice: 'Комментарий успешно создан.'
    else
      render 'posts/show'
    end
  end

  def destroy
    authorize! comment
    comment.destroy
    respond_with comment, location: -> {post_path(comment.post)}
  end

  private

  def set_comment
    comment = post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body).merge({user: current_user})
  end
end
