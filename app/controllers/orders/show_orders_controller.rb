class ShowOrdersController < ApplicationController
  authorize_resource class: ShowOrdersController

  def call
    @menu, @orders = OrdersShow.new.call(params[:id])

    render 'orders/show'
  rescue => err
    puts "Error showing the results. Error: #{err}"
    flash[:danger] = 'Error showing the results'

    redirect_to menus_path
  end
end
