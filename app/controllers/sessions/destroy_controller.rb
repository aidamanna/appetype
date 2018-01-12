module Sessions
  class DestroyController < ApplicationController
    def call
      session[:user_id] = nil
      redirect_to root_path
    end
  end
end
