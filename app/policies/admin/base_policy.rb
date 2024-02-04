class BasePolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def index?
    user.admin?
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  # def create?
  #   record.parent == user
  # end

  # def edit?
  #   record.parent == user || record == user
  # end

  # def update?
  #   record.parent == user || record == user
  # end
end