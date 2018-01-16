module Menus
  class CloseController < ApplicationController
    authorize_resource class: CloseController

    def call
      begin
        typeform_api = Typeform::API.new(current_user.id)
        form_client = typeform_api.form_client
        Menus::Closer.new(form_client).call(menu_id)
        flash[:success] = 'Menu closed.'
      rescue Error::NoOauthToken
        flash[:danger] = 'You need to authorize Appetype to use Typeform.'
      rescue Error::MenuStatus
        flash[:danger] = 'Error closing the menu.'
      rescue FormClient::EditFormError => exception
        logger.error "[#{exception.class}] #{exception} \n#{exception.backtrace}"
        flash[:danger] = 'Error closing menu.'
      rescue StandardError => exception
        logger.error "[#{exception.class}] #{exception} \n#{exception.backtrace}"
        flash[:danger] = 'Error closing the menu.'
      end
      redirect_to menus_path
    end

    private

    def menu_id
      params.require(:id)
    end
  end
end
