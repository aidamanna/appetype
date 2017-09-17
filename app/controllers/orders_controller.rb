class OrdersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :require_login

  def create
    request_body = JSON.parse(request.body.read, symbolize_names: true)

    unless event_already_processed?(request_body[:event_id])
      Webhook.create(
        event_id: request_body[:event_id],
        event_type: request_body[:event_type],
        form_response: request_body[:form_response]
      )
    end
  end

  def event_already_processed?(event_id)
    !Webhook.find_by_event_id(event_id).nil?
  end
end
