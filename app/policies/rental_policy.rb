class RentalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def destroy?
    record.user = user
    #Il faut ajouter le cas où le owner destroy !!
  end

end
