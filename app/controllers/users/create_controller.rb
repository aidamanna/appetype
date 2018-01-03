module Users
  class CreateController < ApplicationController
    skip_before_action :require_login

    def call
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to menus_path
      else
        render '/users/new'
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
  end
end