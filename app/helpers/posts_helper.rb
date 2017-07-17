module PostsHelper
  def post_deletable?(post, user)
    true
    # user && user == post.user || user.is_actived_admin
    if user.blank?
      false
    else
      user == post.user || user.is_actived_admin
    end
  end
end
