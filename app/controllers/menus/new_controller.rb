module Menus
  class NewController < ApplicationController
    authorize_resource class: NewController

    def call
      next_week = Menus::NextWeekPicker.new.call
      @menu = Menu.new(week: next_week)

      render 'menus/new'
    end
  end
end
