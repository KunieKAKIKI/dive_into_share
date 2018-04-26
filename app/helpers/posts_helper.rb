module PostsHelper
  def team_id_options
    current_user.teams
                .order(:id)
                .map { |t| [t.name, t.id, data: { path: select_team_path(t) }] }
  end
end
