module Oauth
  class CreateTokenController < ApplicationController
    authorize_resource class: CreateTokenController

    def call
      begin
        oauth_client = OauthClient.new
        Oauth::TokenCreator.new(oauth_client).call(current_user.id, temp_auth_code)
        flash[:success] = 'Appetype is authorized to use Typeform'
      rescue StandardError => exception
        logger.error "[#{exception.class}] #{exception} \n#{exception.backtrace}"
        flash[:danger] = 'Error getting the oauth token to use Typeform.'
      end
      redirect_to menus_path
    end

    private

    def temp_auth_code
      params.require(:code)
    end
  end
end
