class LeadPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def home?
    true
  end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    true
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