class CommentDecorator < ApplicationDecorator
  delegate :body, :id

end
