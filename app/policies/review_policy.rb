class reviewPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      # review.all
      scope.all

    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?

  end

  def delete?
  end
end
