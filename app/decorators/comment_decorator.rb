class CommentDecorator < ApplicationDecorator
  delegate :body, :to_model
end
