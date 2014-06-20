class CollaboratorPolicy < ApplicationPolicy

  def show?
    user.present? || user.role?(:premium)
  end

  def create?
    user.present? || user.role?(:premium) || user.role?(:admin)
  end

end