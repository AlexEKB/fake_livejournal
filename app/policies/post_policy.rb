class PostPolicy < ApplicationPolicy
  def new?
    true
  end

  def edit?
    user.id == record.user_id
  end
end
