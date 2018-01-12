module Sessions
  class CreateController < ApplicationController
    layout 'simple'
    skip_before_action :require_login

    def call
      user = User.find_by(email: email)
      if user && user.authenticate(password)
        session[:user_id] = user.id
        redirect_to menus_path
      else
        flash.now[:danger] = 'Invalid login.'
        render 'sessions/new'
      end
    end

    private

    def email
      params.require(:session)[:email].downcase
    end

    def password
      params.require(:session)[:password]
    end
  end
end
