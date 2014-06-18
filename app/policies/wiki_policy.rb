class WikiPolicy < ApplicationPolicy

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.admin?
        scope.all
      else
        scope.public_wikis + user.wikis
      end
    end
  end

  def index?
    true
  end

  def show?
    record.pubilc || collaboration.present? || user.present? && user.admin?
  end

  def create_private?
    user.present? && (user.admin? || user.premium?)
  end

  def create?
    record.pubilc || create_private?
  end

  def update?
    record.pubilc ||
    (collaboration.present? && (collaboration.role.admin? || collaboration.role.editor?)) ||
    (user.present? && user.admin?)
  end

private
  
  def collaboration
    @collaboration ||= Collaborator.find_by(user: user, wiki: record)
  end

end
