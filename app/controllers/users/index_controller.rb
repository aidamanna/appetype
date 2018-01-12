module Users
  class IndexController < ApplicationController
    authorize_resource class: IndexController

    def call
      @users = PaginateUsersQuery.new.call(params[:page])

      render 'users/index'
    end
  end
end
