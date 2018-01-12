module Users
  class DestroyController < ApplicationController
    authorize_resource class: DestroyController

    def call
      @user = User.find(user_id)
      if @user.destroy
        flash[:success] = "User '#{@user.email}' deleted."
      else
        flash[:danger] = "Error deleting the user '#{@user.email}'."
      end
      redirect_to users_path
    end

    private

    def user_id
      params.require(:id)
    end
  end
end
