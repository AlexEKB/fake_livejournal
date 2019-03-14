class UserDecorator < BaseDecorator
  include Draper::LazyHelpers
  delegate :email, :id

  def username
    "#{email.split('@')[0].capitalize}"
  end

  def email_with_id
    "#{email} #{id}"
  end
end
