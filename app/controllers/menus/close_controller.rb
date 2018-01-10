module Menus
  class CloseController < ApplicationController
    authorize_resource class: CloseController

    def call
      begin
        typeform_api = Typeform::API.new(current_user.id)
        form_client = typeform_api.form_client
        Menus::Closer.new(form_client).call(params[:id])
        flash[:success] = 'Menu closed'
      rescue StandardError => exception
        logger.error "[#{exception.class}] #{exception} \n#{exception.backtrace}"
        flash[:danger] = 'Error closing menu.'
      end
      redirect_to menus_path
    end
  end
end
