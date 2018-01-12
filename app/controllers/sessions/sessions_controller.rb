class SessionsController < ApplicationController
  layout 'simple', only: %i[new create]
  skip_before_action :require_login, only: %i[new create]

  def new
    redirect_to menus_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to menus_path
    else
      flash[:danger] = 'Invalid login.'
      render 'new'
    end
  end
end
