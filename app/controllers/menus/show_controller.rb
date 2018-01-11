module Menus
  class ShowController < ApplicationController
    authorize_resource class: ShowController

    def call
      @menu = Menu.find(menu_id)

      render 'menus/show'
    end

    private

    def menu_id
      params.require(:id)
    end
  end
end
