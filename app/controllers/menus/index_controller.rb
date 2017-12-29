module Menus
  class IndexController < ApplicationController
    authorize_resource class: IndexController

    def call
      @menus = PaginateMenusQuery.new.call(params[:page])

      render 'menus/index'
    end
  end
end
