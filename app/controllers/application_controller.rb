class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to '/login' unless current_user
  end

  def logout_required
    redirect_to '/' if current_user
  end

  def admin_required
    redirect_to '/' unless current_user and current_user.email == ENV["ADMIN_EMAIL"]
  end

end
