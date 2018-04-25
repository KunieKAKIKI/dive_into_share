class CategoriesLoyalty < ApplicationLoyalty
  def new?
    user.editable?(record)
  end

  def create?
    user.editable?(record)
  end

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
