class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_required
    unless current_user.is_admin?
      redirect_to '/'
    end
  end

  private
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
