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

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  rescue_from CanCan::AccessDenied do |_exception|
    render file: "#{Rails.root}/public/403.html.erb", status: 403, layout: false
  end

  private

  def require_login
    return if logged_in?
    redirect_to login_url
  end
end
