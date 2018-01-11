module Menus
  class FillController < ApplicationController
    authorize_resource class: FillController

    def call
      @menu = Menu.find(menu_id)

      render 'menus/fill'
    end

    private

    def menu_id
      params.require(:id)
    end
  end
end
