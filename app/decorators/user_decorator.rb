class UserDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate :email, :id

  def username
    "#{email.split('@')[0].capitalize.to_s}"
  end

  def email_with_id
    "#{email} #{id}"
  end
end
