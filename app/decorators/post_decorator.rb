class PostDecorator < Draper::Decorator
  delegate :title, :text, :to_model

  def email_with_id
    "#{object.email} #{object.id}"
  end
end
