class UsersController < ApplicationController
  load_and_authorize_resource

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "User '#{@user.email}' deleted."
    else
      flash[:danger] = "Error deleting the user '#{@user.email}'."
    end
    redirect_to users_path
  end
end
