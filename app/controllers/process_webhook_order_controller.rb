class ProcessWebhookOrderController < ApplicationController
  skip_before_filter :verify_authenticity_token, :require_login

  def call
    webhook_order = JSON.parse(request.body.read, symbolize_names: true)
    WebhookOrderProcessor.new.call(webhook_order)
  end
end
