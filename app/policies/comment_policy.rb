class CommentPolicy < ApplicationPolicy
  def create?
    true
  end

  def destroy?
    user && user.id == record.user_id
  end
end
