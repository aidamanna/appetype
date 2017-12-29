module Menus
  class CloseController < ApplicationController
    authorize_resource class: CloseController

    def call
      begin
        Menus::Closer.new.call(current_user.id, params[:id])
        flash[:success] = 'Menu closed'
      rescue => err
        puts "Error closing the menu. Error: #{err}"
        flash[:danger] = 'Error closing menu'
      end
      redirect_to menus_path
    end
  end
end
