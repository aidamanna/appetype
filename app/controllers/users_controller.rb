class UsersController < ApplicationController
  layout 'simple', only: [:new, :create]
  skip_before_filter :require_login, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update]
  load_and_authorize_resource

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

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
