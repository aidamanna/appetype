module Menus
  class EditController < ApplicationController
    authorize_resource class: EditController

    def call
      @menu = Menu.find(menu_id)

      render 'menus/edit'
    end

    private

    def menu_id
      params.require(:id)
    end
  end
end
