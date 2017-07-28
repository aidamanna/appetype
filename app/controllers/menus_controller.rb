class MenusController < ApplicationController
  def new
    @menu = Menu.new
  end

  def create
    #render plain: params[:week].inspect
    @menu = Menu.new(menu_params)
    @menu.save

    redirect_to menus_show(@menu)
  end

  private
  def menu_params
    {
      week: params[:week],
      daily_menus: {
        monday: {
            side_dish: params[:monday_side_dish],
            omni: params[:monday_omni],
            veggie: params[:monday_veggie]
        },
        tuesday: {
          side_dish: params[:tuesday_side_dish],
          omni: params[:tuesday_omni],
          veggie: params[:tuesday_veggie]
        }
      }
    }
  end
end
