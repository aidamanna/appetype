module Sessions
  class NewController < ApplicationController
    layout 'simple'
    skip_before_action :require_login

    def call
      if logged_in?
        redirect_to menus_path
      else
        render 'sessions/new'
      end
    end
  end
end
