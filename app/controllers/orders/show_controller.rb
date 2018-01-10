module Orders
  class ShowController < ApplicationController
    authorize_resource class: ShowController

    def call
      @menu, @orders = Orders::Show.new.call(menu_id)

      render 'orders/show'
    rescue StandardError => exception
      logger.error "[#{exception.class}] #{exception} \n#{exception.backtrace}"
      flash[:danger] = 'Error showing the results.'

      redirect_to menus_path
    end

    private

    def menu_id
      params.require(:id)
    end
  end
end
