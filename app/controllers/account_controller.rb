class AccountController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to user_path(@user)
    end
  end

  private
    def user_params
      params.require(:user).permit(:account_name, :account_avatar, :account_back_ground, :signature)
    end
end
