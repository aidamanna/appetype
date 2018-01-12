module Users
  class ShowController < ApplicationController
    authorize_resource class: ShowController

    def call
      @user = User.find(user_id)

      render 'users/show'
    end

    private

    def user_id
      params.require(:id)
    end
  end
end
