module Menus
  class CreateController < ApplicationController
    authorize_resource class: CreateController

    def call
      next_week = Menus::NextWeekPicker.new.call
      @menu = Menu.new(week: next_week, daily_menus: daily_menus)
      if @menu.save
        flash[:success] = "Menu '#{@menu.week_description}' created."
        redirect_to menu_path(@menu)
      else
        render 'menus/new'
      end
    end

    private

    def daily_menus
      {
        monday: {
          side_dish: params[:monday_side_dish],
          omni: params[:monday_omni],
          veggie: params[:monday_veggie]
        },
        tuesday: {
          side_dish: params[:tuesday_side_dish],
          omni: params[:tuesday_omni],
          veggie: params[:tuesday_veggie]
        },
        wednesday: {
          side_dish: params[:wednesday_side_dish],
          omni: params[:wednesday_omni],
          veggie: params[:wednesday_veggie]
        },
        thursday: {
          side_dish: params[:thursday_side_dish],
          omni: params[:thursday_omni],
          veggie: params[:thursday_veggie]
        },
        friday: {
          side_dish: params[:friday_side_dish],
          omni: params[:friday_omni],
          veggie: params[:friday_veggie]
        }
      }
    end
  end
end
