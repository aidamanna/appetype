class OrdersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :require_login

  def create
    puts 'RECEIVED WEBHOOK'
    puts request.body.read
  end
end
