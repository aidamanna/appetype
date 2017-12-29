module Oauth
  class AuthorizeUserController < ApplicationController
    authorize_resource class: AuthorizeUserController

    def call
      redirect_uri = Config.base_url + '/oauth/token'
      scopes = 'forms:read+forms:write+webhooks:write'
      authorization_url = "#{Config.typeform_base_endpoint}/oauth/authorize?"\
          'state=xyz789&'\
          "client_id=#{Config.typeform_client_id}&"\
          "redirect_uri=#{redirect_uri}&" \
          "scope=#{scopes}"

      redirect_to(authorization_url)
    rescue => err
      puts "Error authorizing Appetype to use Typeform. Error: #{err}"
      flash[:danger] = 'Error authorizing Appetype to use Typeform'
      redirect_to menus_path
    end
  end
end
