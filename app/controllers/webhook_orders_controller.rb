class WebhookOrdersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :require_login

  def create
    request_body = JSON.parse(request.body.read, symbolize_names: true)
    return if event_already_processed?(request_body[:event_id])

    form_response = request_body[:form_response]

    create_order(form_response)
    create_webhook(form_response, request_body)
  end

  private

  def event_already_processed?(event_id)
    !Webhook.find_by_event_id(event_id).nil?
  end

  def create_order(form_response)
    form_id = form_response[:form_id]
    daily_orders_refs = daily_order_refs(form_id, form_response)

    Order.create(
      menu_id: menu_id(form_id),
      user_id: user_id(form_response),
      daily_orders: daily_orders(daily_orders_refs)
    )
  end

  def daily_order_refs(form_id, form_response)
    form = form_with(form_id)

    form_response[:answers].map do |response|
      field_id = response[:field][:id]
      choice_label = response[:choice][:label]
      form.choice_ref(field_id, choice_label)
    end
  end

  def form_with(form_id)
    form_definition = FormClient.new.retrieve(form_id)
    Form.new(form_definition)
  end

  def menu_id(form_id)
    Menu.find_by_form(form_id).id
  end

  def user_id(form_response)
    email = form_response[:hidden][:email]
    User.find_by_email(email).id
  end

  def daily_orders(daily_orders_refs)
    daily_orders = {}

    daily_orders_refs.each do |r|
      daily_orders.merge!(DailyOrder.from_ref(r).to_hash)
    end

    daily_orders
  end

  def create_webhook(form_response, request_body)
    Webhook.create(
      event_id: request_body[:event_id],
      event_type: request_body[:event_type],
      form_response: form_response
    )
  end
end
