class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :require_login

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  private

  def require_login
    unless current_user
      redirect_to login_url
    end
  end
end
