module Users
  class NewInviteController < ApplicationController
    authorize_resource class: NewInviteController

    def call
      @user_invitation = UserInvitation.new
      render 'users/invite'
    end
  end
end
