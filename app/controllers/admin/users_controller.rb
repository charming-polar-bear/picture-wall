class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @users = User.all.where(is_admin: false)
  end

  def active
    @current_user = current_user
    @current_user.active!
    redirect_to :back
  end

  def disactive
    @current_user = current_user
    @current_user.disactive!
    redirect_to :back
  end

  def set
    @user = User.find(params[:id])
    unless @user.is_admin
      @user.set_admin!
      redirect_to :back
    end
  end

  def remove
    @user = User.find(params[:id])
    if @user.is_admin
      @user.remove_admin!
      redirect_to :back
    end
  end
end
