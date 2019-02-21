class PostPolicy < ApplicationPolicy
  def new?
    true
  end

  def edit?
    user && user.id == record.user_id
  end
end
