module UsersHelper
  def member_name_class(post, user)
    if user == post.user
      'font-weight-bold'
    elsif user == User.last
      'text-danger'
    else
      'font-weight-normal'
    end
  end
end
