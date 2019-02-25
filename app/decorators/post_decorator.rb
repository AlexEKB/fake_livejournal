class PostDecorator < Draper::Decorator
  delegate :title, :text, :id

  def comments_count
    post.comments.length
  end
end
