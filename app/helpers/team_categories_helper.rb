module TeamCategoriesHelper
  def shallow_args(team, category)
    category.try(:new_record?) ? [team, category] : category
  end
end
