module Menus
  class UpdateController < ApplicationController
    authorize_resource class: UpdateController

    def call
      @menu = Menu.find(menu_id)
      raise Error::MenuStatus, 'The menu status is not draft and cannot be updated' unless @menu.state == 'draft'
      if @menu.update(daily_menus: daily_menus)
        flash[:success] = 'Menu updated.'
        redirect_to menu_path(@menu)
      else
        render 'menus/edit'
      end
    rescue Error::MenuStatus
      flash[:danger] = 'Error updating the menu.'
      redirect_to menu_path(@menu)
    end

    private

    def menu_id
      params.require(:id)
    end

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
