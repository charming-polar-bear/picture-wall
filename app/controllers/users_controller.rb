class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @posts = case params[:category]
              when 'like'
                @user.liking_posts
              when 'publish'
                @user.posts
              else
                @user.posts
              end
  end

end
