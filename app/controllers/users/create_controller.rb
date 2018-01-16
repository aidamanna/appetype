module Users
  class CreateController < ApplicationController
    layout 'simple'
    skip_before_action :require_login

    def call
      session[:user_id] = Users::Creator.new.call(user_params, token)
      redirect_to menus_path
    rescue Users::Creator::InvitationNotFound => exception
      logger.debug "[#{exception.class}] #{exception}"
      flash[:danger] = 'This email address has not been invited to use Appetype. Ask your admin to invite you.'
      render_users_new
    rescue Error::DatabaseValidations => exception
      @validation_errors = exception.errors
      render_users_new
    rescue StandardError => exception
      logger.error "[#{exception.class}] #{exception} \n#{exception.backtrace}"
      flash[:danger] = 'Error signing up the user.'
      render_users_new
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def token
      params.require(:token)
    end

    def render_users_new
      @user = User.new(user_params)
      render '/users/new'
    end
  end
end
