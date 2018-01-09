module Users
  class CreateController < ApplicationController
    layout 'simple'
    skip_before_action :require_login

    def call
      session[:user_id] = Users::Creator.new.call(user_params)
      redirect_to menus_path
    rescue Error::NotInvitedUser => err
      puts "Error: #{err}"
      flash[:danger] = 'This email address has not been invited to use Appetype. Ask your admin to invite you.'

      @user = User.new(user_params)
      render '/users/new'
    rescue Error::DatabaseValidations => err
      @validation_errors = err.errors
      @user = User.new(user_params)
      render '/users/new'
    rescue => err
      puts "Error creating the user. Error: #{err}"
      flash[:danger] = 'Error signing up the user'

      @user = User.new(user_params)
      render '/users/new'
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
  end
end
