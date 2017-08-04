class MenusController < ApplicationController
  before_action :set_menu, only: [:edit, :update, :show]

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    #render plain: params[:week].inspect
    @menu = Menu.new(menu_params)
    if @menu.save
      flash[:notice] = "Menu created"
      redirect_to menu_path(@menu)
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @menu.update(menu_params)
      flash[:notice] = "Menu updated"
      redirect_to menu_path(@menu)
    else
      render 'edit'
    end
  end

  private
  def set_menu
    @menu = Menu.find(params[:id])
  end

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
    }
  end
end
