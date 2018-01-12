class SessionsController < ApplicationController
  layout 'simple', only: %i[create]
  skip_before_action :require_login, only: %i[create]

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
