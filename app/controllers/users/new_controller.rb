module Users
  class NewController < ApplicationController
    layout 'simple'
    skip_before_action :require_login

    def call
      return redirect_to menus_path if logged_in?
      @user = User.new
      render 'users/new'
    end
  end
end
