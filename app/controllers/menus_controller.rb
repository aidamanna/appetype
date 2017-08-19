class MenusController < ApplicationController
  before_action :set_menu, only: [:edit, :update, :show]

  def index
    @menus = Menu.all.order('id DESC')
  end

  def new
    @menu = Menu.new
    @menu.week = next_week
  end

  def create
    @menu = Menu.new(week: next_week, daily_menus: daily_menus)
    if @menu.save
      flash[:success] = "Menu created"
      redirect_to menu_path(@menu)
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @menu.update(daily_menus: daily_menus)
      flash[:success] = "Menu updated"
      redirect_to menu_path(@menu)
    else
      render 'edit'
    end
  end

  private
  def set_menu
    @menu = Menu.find(params[:id])
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

  def next_week
    last_menu = Menu.last
    date = last_menu.nil? ? Date.today : Date.strptime(last_menu[:week], '%YW%W')
    date.next_day(7).strftime('%YW%W')
  end
end
