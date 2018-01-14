module Menus
  class Publisher
    def initialize(form_client, webhook_client)
      @form_client = form_client
      @webhook_client = webhook_client
    end

    def call(menu_id)
      menu = Menu.find(menu_id)
      raise Error::MenuStatus, 'The menu status is not draft and cannot be published' unless menu.state == 'draft'
      form_uid = form_client.create(menu.to_form_payload)
      webhook_client.create(form_uid)
      menu.update(state: 'published', form: form_uid)
    end

    private

    attr_reader :form_client, :webhook_client
  end
end
