class UserDecorator < BaseDecorator
  include Draper::LazyHelpers
  delegate :email, :id, :first_name, :last_name

  def username
    "#{email.split('@')[0].capitalize}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def email_with_id
    "#{email} #{id}"
  end
end
