class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  def create
    respond_with(@comment = @post.comments.create(comment_params.merge({user: current_user})), location: -> {post_path(@comment.post)})
  end

  def destroy
    @comment.destroy
    respond_with @comment, location: -> {post_path(@comment.post)}
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
