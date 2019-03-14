class PostDecorator < BaseDecorator
  delegate :title, :text

  def comments_count
    post.comments.count
  end
end
