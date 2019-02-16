class CommentPolicy < ApplicationPolicy
  def create?
    true
  end

  def destroy?
    user.id == record.user_id
  end
end
