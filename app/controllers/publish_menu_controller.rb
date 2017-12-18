class PublishMenuController < ApplicationController
  authorize_resource class: PublishMenuController

  def call
    begin
      MenuPublisher.new.call(current_user.id, params[:id])
      flash[:success] = 'Menu published'
    rescue => err
      puts "Error publishing the menu. Error: #{err}"
      flash[:danger] = 'Error publishing menu'
    end
    redirect_to menus_path
  end
end
