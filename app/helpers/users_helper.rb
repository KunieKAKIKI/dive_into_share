module UsersHelper
  def member_name(post, user)
    if user == @post.user
      content_tag :span, user.name, class: 'font-weight-bold'
    elsif user == User.last
      content_tag :span, user.name, class: 'text-danger'
    else
      content_tag :span, user.name
    end
  end
end
