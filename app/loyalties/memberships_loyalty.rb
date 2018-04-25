class MembershipsLoyalty < ApplicationLoyalty
  def create?
    user.editable?(record)
  end

  def destroy?
    user.editable?(record)
  end
end
