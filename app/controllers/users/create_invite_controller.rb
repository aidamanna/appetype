module Users
  class CreateInviteController < ApplicationController
    authorize_resource class: CreateInviteController

    def call
      email = params[:user_invitation][:email]

      begin
        Users::InviteCreator.new.call(email)

        flash[:success] = 'The invitation email has been sent'
        redirect_to users_path
      rescue Error::ExistingUser
        flash[:danger] = 'This email address is already associated with an account'

        @user_invitation = UserInvitation.new_with_email(email)
        render 'users/invite'
      rescue Error::DatabaseValidations => err
        @user_invitation = err.object
        render 'users/invite'
      rescue => err
        puts "Error inviting the user. Error: #{err}"
        flash[:danger] = 'Error inviting the user'
        redirect_to users_path
      end
    end
  end
end
