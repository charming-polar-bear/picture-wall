class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @users = User.all.where(is_admin: false)
    @users = User.all
  end
end
