module Users
  class CreateInviteController < ApplicationController
    authorize_resource class: CreateInviteController

    def call
      begin
        email = params[:user_invitation][:email]
        Users::InviteCreator.new.call(email)
        flash[:success] = 'The invitation email has been sent'
      rescue => err
        puts "Error inviting the user. Error: #{err}"
        flash[:danger] = 'Error inviting the user'
      end
      redirect_to users_path
    end
  end
end
