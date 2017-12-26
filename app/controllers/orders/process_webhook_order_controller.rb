class ProcessWebhookOrderController < ApplicationController
  skip_before_action :verify_authenticity_token, :require_login

  def call
    webhook_order = JSON.parse(request.body.read, symbolize_names: true)
    WebhookOrderProcessor.new.call(webhook_order)
  rescue => err
    puts "Error processing the webhook. Error: #{err}"
  end
end
