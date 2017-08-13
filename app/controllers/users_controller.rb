class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @posts = case params[:category]
              when 'like'
                @user.liking_posts.recent
              when 'comment'
                @user.comment_posts.recent
              else
                @user.posts.recent
              end
  end

end
