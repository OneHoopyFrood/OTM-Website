module PostHelper
  def belongs_to_user?(post, user)
    post.user == user
  end

  def belongs_to_current_user?(post)
    belongs_to_user?(post, current_user)
  end

  def user_can_edit?(post, user)
    user.admin? || belongs_to_user?(post, user)
  end

  def current_user_can_edit?(post)
    user_can_edit?(post, current_user)
  end
end
