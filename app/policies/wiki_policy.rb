class WikiPolicy < ApplicationPolicy

  # class Scope < Struct.new(:user, :scope)
  #   def resolve
  #     scope.where('role > 0')
  #   end
  # end

  def index?
    true
  end



end