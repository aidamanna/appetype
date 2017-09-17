class OrdersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :require_login

  def create
    request_body = JSON.parse(request.body.read, symbolize_names: true)

    @webhook = Webhook.create(
      event_id: request_body[:event_id],
      event_type: request_body[:event_type],
      form_response: request_body[:form_response]
    )
  end
end
