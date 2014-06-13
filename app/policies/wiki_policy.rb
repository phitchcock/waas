class WikiPolicy < ApplicationPolicy

  # class Scope < Struct.new(:user, :scope)
  #   def resolve
  #     scope.where('role > 0')
  #   end
  # end

  def index?
    true
  end

  def create_private?
    user.premium? || user.admin?
  end

  def create?
    super && (record.pubilc || create_private?)
  end


end