class TeamsLoyalty < ApplicationLoyalty
  def edit?
    user.editable?(record)
  end

  def update?
    user.editable?(record)
  end

  def destroy?
    user.editable?(record)
  end
end
