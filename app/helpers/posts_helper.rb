module PostsHelper
  def team_id_options
    current_user.teams
                .order(created_at: :desc)
                .map { |t| [t.name, t.id, data: { path: team_categories_path(t) }] }
  end
end
