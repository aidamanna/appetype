module Menus
  class PublishController < ApplicationController
    authorize_resource class: PublishController

    def call
      begin
        oauth_token = Oauth::TokenRetriever.new.call(current_user.id)
        form_client = FormClient.new(oauth_token)
        webhook_client = WebhookClient.new(oauth_token)
        Menus::Publisher.new(form_client, webhook_client).call(params[:id])
        flash[:success] = 'Menu published'
      rescue => err
        puts "Error publishing the menu. Error: #{err}"
        flash[:danger] = 'Error publishing menu'
      end
      redirect_to menus_path
    end
  end
end
