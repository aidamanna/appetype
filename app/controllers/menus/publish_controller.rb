module Menus
  class PublishController < ApplicationController
    authorize_resource class: PublishController

    def call
      begin
        typeform_api = Typeform::API.new(current_user.id)
        form_client = typeform_api.form_client
        webhook_client = typeform_api.webhook_client
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