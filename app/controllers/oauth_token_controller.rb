class OauthTokenController < ApplicationController
  authorize_resource class: OauthTokenController

  def call
    begin
      temp_auth_code = params[:code]
      OauthToken.new.call(temp_auth_code)
      flash[:success] = 'Appetype is authorized to use Typeform'
    rescue => err
      puts "Error getting the token to use Typeform. Error: #{err}"
      flash[:danger] = 'Error getting the token to use Typeform'
    end
    redirect_to menus_path
  end
end
