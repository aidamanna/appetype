class IndexMenusController < ApplicationController
  authorize_resource class: IndexMenusController

  def call
    @menus = PaginateMenusQuery.new.call(params[:page])

    render 'menus/index'
  end
end
