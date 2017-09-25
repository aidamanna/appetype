class MenuOrdersController < ApplicationController
  def show
    @menu = Menu.find(params[:id])
    @menu_orders = MenuOrders.fake
  end
end
