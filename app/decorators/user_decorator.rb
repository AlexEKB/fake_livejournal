class UserDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate :email, :to_model

  def self.username
    "#{email.split('@')[0].capitalize.to_s}"
    # username ||= object.self.email.split('@')[0].capitalize
  end

  def email_with_id
    "#{object.email} #{object.id}"
  end
end
