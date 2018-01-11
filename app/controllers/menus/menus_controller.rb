class MenusController < ApplicationController
  load_and_authorize_resource

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(daily_menus: daily_menus)
      flash[:success] = "Menu '#{@menu.week_description}' updated."
      redirect_to menu_path(@menu)
    else
      render 'edit'
    end
  end

  def fill
    @menu = Menu.find(params[:id])
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
