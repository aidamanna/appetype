module Users
  class UpdateController < ApplicationController
    authorize_resource class: UpdateController

    def call
      @user = User.find(user_id)
      if @user.update(user_params)
        flash[:success] = 'User updated.'
        redirect_to user_path(@user)
      else
        render 'users/edit'
      end
    end

    private

    def user_id
      params.require(:id)
    end

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
  end
end
