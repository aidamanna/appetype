module Users
  class NewController < ApplicationController
    layout 'simple'
    skip_before_action :require_login

    def call
      return redirect_to menus_path if logged_in?

      begin
        @token = params[:token]
        @user = Users::InviteTokenValidator.new.call(@token)
        render 'users/new'
      rescue Error::InvalidToken => err
        puts "Error getting a valid invitation token. Error: #{err.message}"
        render file: "#{Rails.root}/public/invalid_token_error.html.erb", layout: false
      end
    end
  end
end
