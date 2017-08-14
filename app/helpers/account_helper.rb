module AccountHelper
  def avatar_url(user, size)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=identicon"
  end

  def render_user_avatar(user, size)
    if user.account_avatar.present?
      user.account_avatar
    else
      avatar_url(user, size)
    end
  end
end
