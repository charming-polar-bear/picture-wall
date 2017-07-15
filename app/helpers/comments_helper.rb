module CommentsHelper
  def comment_deletable?(user)
    user && user == comment.user || user == comment.post.user || user.is_actived_admin
  end
end
