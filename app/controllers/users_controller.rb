class UsersController < ApplicationController
  layout 'simple', only: %i[new create]
  skip_before_filter :require_login, only: %i[new create]
  before_action :set_user, only: %i[show edit update destroy]
  load_and_authorize_resource except: %i[new create]

  def index
    @users = User.paginate(page: params[:page], per_page: 5).order(:name)
  end

  def new
    redirect_to menus_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to menus_path
    else
      render '/users/new'
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
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
