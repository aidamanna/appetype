module Users
  class EditController < ApplicationController
    authorize_resource class: EditController

    def call
      @user = User.find(user_id)

      render 'users/edit'
    end

    private

    def user_id
      params.require(:id)
    end
  end
end
