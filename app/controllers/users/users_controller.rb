class UsersController < ApplicationController
  before_action :set_user, except: %i[index]
  load_and_authorize_resource

  def index
    @users = User.paginate(page: params[:page], per_page: 4).order(:name)
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'User updated'
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User '#{@user.email}' deleted"
    else
      flash[:danger] = "Error deleting the user '#{@user.email}'"
    end
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
