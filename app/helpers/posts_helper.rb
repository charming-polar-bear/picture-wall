module PostsHelper
  def post_deletable?(post, user)
    user && user == post.user || user.is_actived_admin
  end
end
