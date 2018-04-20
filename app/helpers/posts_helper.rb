module PostsHelper
  def team_id_options
    current_user.teams
                .order(:id)
                .map { |t| [t.name, t.id, data: { path: select_team_path(t) }] }
  end

  def render_select_box(post:, form:)
    if needs_to_initialize?(post)
      render 'selectable_posts/initialized_select_box', post: post, form: form
    else
      render 'selectable_posts/select_box', post: post, form: form
    end
  end

  private

  def needs_to_initialize?(post)
    post.category_id.blank?
  end
end
