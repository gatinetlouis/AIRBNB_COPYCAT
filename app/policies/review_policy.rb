class ReviewPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      # review.all
      scope.all

    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def show?

  end

  def delete?
  end
end
