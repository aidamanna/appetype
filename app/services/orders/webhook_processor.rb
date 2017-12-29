module Orders
  class WebhookProcessor
    def call(webhook_order)
      return if event_already_processed?(webhook_order[:event_id])

      create_order(webhook_order[:form_response])
      create_webhook(webhook_order)
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
      FormDefinition.new(form_definition)
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

    def create_webhook(webhook_order)
      Webhook.create(
        event_id: webhook_order[:event_id],
        event_type: webhook_order[:event_type],
        form_response: webhook_order[:form_response]
      )
    end
  end
end
