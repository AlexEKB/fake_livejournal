class UserPolicy < ApplicationPolicy
  def edit?
    user.id == record.id
  end

  def update?
    user.id == record.id
  end

  def destroy?
    user.id == record.id
  end
end
